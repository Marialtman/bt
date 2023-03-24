/*
 * Copyright (c) 2019 Actions Semiconductor Co., Ltd
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief OTA upgrade interface
 */

#include <kernel.h>
#include <string.h>
#include <device.h>
#include <flash.h>
#include <soc.h>
#include <misc/util.h>
#include <logging/sys_log.h>
#include <fw_version.h>
#include <partition.h>
#include <mem_manager.h>
#include <crc.h>
#include <ota/ota_upgrade.h>
#include <ota/ota_backend.h>
#include "ota_image.h"
#include "ota_storage.h"
#include "ota_manifest.h"
#include "ota_breakpoint.h"
#include "ota_file_patch.h"

#define OTA_ERASE_ALIGN_SIZE		4096
#define OTA_DATA_BUFFER_SIZE		1536

#define OTA_MANIFESET_FILE_NAME		"ota.xml"

#define OTA_FLAG_USE_RECOVERY		(1 << 0)
#define OTA_FLAG_USE_RECOVERY_APP	(1 << 1)
#define OTA_FLAG_USE_NO_VERSION_CONTROL	(1 << 2)

#define ota_use_recovery(ota)		((ota)->flags & OTA_FLAG_USE_RECOVERY)
#define ota_use_recovery_app(ota)	((ota)->flags & OTA_FLAG_USE_RECOVERY_APP)
#define ota_use_no_version_control(ota)	((ota)->flags & OTA_FLAG_USE_NO_VERSION_CONTROL)

#define EIO_READ			(1001)

struct ota_upgrade_info {
	int state;
	int backend_type;
	unsigned int flags;

	ota_notify_t notify;

	struct ota_image *img;
	struct ota_storage *storage;

	int data_buf_size;
	u8_t *data_buf;
	u32_t xml_offset;
	struct ota_manifest manifest;
	struct ota_breakpoint bp;
};

static void ota_update_state(struct ota_upgrade_info *ota, enum ota_state state)
{
    int old_state;

	SYS_LOG_INF("upadte ota state:  %d\n", state);

	old_state = ota->state;

	ota->state = state;

	if (ota->notify) {
		ota->notify(state, old_state);
	}
}

static int ota_partition_erase_part(struct ota_upgrade_info *ota,
			     const struct partition_entry *part,
			     int start_offset)
{
	int err, align_addr, align_size;

	SYS_LOG_INF("erase part %s: offset 0x%x size 0x%x, start_offset 0x%x",
		part->name, part->offset, part->size, start_offset);

	align_addr = ROUND_DOWN(part->offset + start_offset, OTA_ERASE_ALIGN_SIZE);
	align_size = ROUND_UP(part->size - start_offset, OTA_ERASE_ALIGN_SIZE);

	SYS_LOG_INF("erase aligned offset 0x%x, size 0x%x",
		align_addr, align_size);

	err = ota_storage_erase(ota->storage, align_addr, align_size);
	if (err) {
		return err;
	}

	return 0;
}

static int ota_partition_update_prepare(struct ota_upgrade_info *ota)
{
	struct ota_breakpoint *bp = &ota->bp;
	const struct partition_entry *part;
	int i, file_state, erase_offset;

	SYS_LOG_INF("bp->state %d", bp->state);

	if (bp->state == OTA_BP_STATE_CLEAN) {
		/* state is clean, skip erase */
		SYS_LOG_INF("bp state is clean, skip erase parts");
		return 0;
	}

	if (ota_use_recovery(ota)) {
		if (bp->state == OTA_BP_STATE_UPGRADE_PENDING) {
			/* state is clean, skip erase */
			SYS_LOG_INF("upgrade pending, skip erase parts");
			return 0;
		}

		/* don't erase temp part is upgrading is going, it will be erased before write file */
		if (bp->state == OTA_BP_STATE_UPGRADE_WRITING ||
		    bp->state == OTA_BP_STATE_UPGRADING_FAIL) {
			SYS_LOG_INF("upgrade is in process, skip erase temp part");
			return 0;
		}
	}

	for (i = 0; i < MAX_PARTITION_COUNT; i++) {
		part = partition_get_part_by_id(i);
		if (part == NULL)
			return -EINVAL;

		if (part->file_id == 0)
			continue;

		if (!ota_use_recovery(ota)) {
			/* skip current firmware's partitions */
			if (!partition_is_mirror_part(part)) {
				SYS_LOG_INF("part[%d]: skip current used partition", i);
				continue;
			}
		} else {
			/* only temp partition need be erased when recovery is enabled */
			if (part->type != PARTITION_TYPE_TEMP &&
			    part->file_id != PARTITION_FILE_ID_OTA_TEMP) {
				SYS_LOG_INF("part[%d]: file_id %d not ota temp partition, skip erase",
					i, part->file_id);
				continue;
			}

			/* don't erase partition that not in current storage */
			if (part->storage_id != ota_storage_get_storage_id(ota->storage)) {
				SYS_LOG_INF("part[%d]: part file_id %d storage_id %d not current storage_id, skip erase",
					i, part->file_id, part->storage_id);
				continue;
			}
		}

		if (bp->state == OTA_BP_STATE_UPGRADE_WRITING ||
		    bp->state == OTA_BP_STATE_WRITING_IMG) {
			/* check breakpoint */
			file_state = ota_breakpoint_get_file_state(bp, part->file_id);

			SYS_LOG_INF("bp->state %d file_state %d", bp->state, file_state);

			if (file_state == OTA_BP_FILE_STATE_CLEAN ||
			    file_state == OTA_BP_FILE_STATE_WRITE_DONE ||
			    file_state == OTA_BP_FILE_STATE_VERIFY_PASS ||
			    file_state == OTA_BP_FILE_STATE_WRITING_CLEAN) {
				SYS_LOG_INF("part[%d]: file_id %d file_state %d, skip erase",
					i, part->file_id, file_state);

				/* skip erase this partition */
				continue;
			} else if (file_state == OTA_BP_FILE_STATE_WRITING) {
				if (ota_use_recovery(ota) ||
					(bp->mirror_id == partition_get_current_mirror_id())) {
					/* parition is writing, not clean */
					erase_offset = bp->cur_file.offset + bp->cur_file_write_offset;
					erase_offset &= ~(OTA_ERASE_ALIGN_SIZE - 1);
					erase_offset -= part->offset;

					SYS_LOG_INF("part[%d]: file_id %d writing",
						i, part->file_id);
					SYS_LOG_INF("file offset 0x%x, write_offset 0x%x, need erase from 0x%x",
						bp->cur_file.offset, bp->cur_file_write_offset, erase_offset);

					/* update write offset aligned with erase sector */
					bp->cur_file_write_offset = part->offset + erase_offset - bp->cur_file.offset;

					ota_partition_erase_part(ota, part, erase_offset);
					ota_breakpoint_set_file_state(bp, part->file_id, OTA_BP_FILE_STATE_WRITING_CLEAN);
					continue;
				}
			}
		}

		ota_partition_erase_part(ota, part, 0);
		ota_breakpoint_set_file_state(bp, part->file_id, OTA_BP_FILE_STATE_CLEAN);
	}

	if (bp->state != OTA_BP_STATE_UPGRADE_WRITING &&
	    bp->state != OTA_BP_STATE_WRITING_IMG) {
		if (bp->state != OTA_BP_STATE_UNKOWN) {
			/* clear all old status */
			SYS_LOG_INF("clear old bp status");
			ota_breakpoint_init_default_value(&ota->bp);
		}

		bp->state = OTA_BP_STATE_CLEAN;
		SYS_LOG_INF("bp state is clean");
	}

	ota_breakpoint_save(bp);

	return 0;
}

static int ota_caculate_storage_file_crc(struct ota_upgrade_info *ota, struct ota_file *file)
{
	struct ota_storage *storage = ota->storage;
	int addr, size, rlen;
	u32_t crc;

	crc = 0;
	size = file->size;
	addr = file->offset;

	SYS_LOG_INF("check file %s: addr 0x%x, size 0x%x",
		file->name, addr, size);

	rlen = ota->data_buf_size;
	while (size > 0) {
		if (size < rlen)
			rlen = size;

		ota_storage_read(storage, addr, ota->data_buf, rlen);

		crc = utils_crc32(crc, ota->data_buf, rlen);

		size -= rlen;
		addr += rlen;
	}

	return crc;
}

static int ota_verify_file(struct ota_upgrade_info *ota, struct ota_file *file)
{
	u32_t crc_calc, crc_orig;

	// FIXME
	if (file->file_id != PARTITION_FILE_ID_OTA_TEMP)
	{
		crc_calc = ota_caculate_storage_file_crc(ota, file);
		crc_orig = file->checksum;

		SYS_LOG_INF("check file %s: crc_orig 0x%x, crc_calc 0x%x",
			file->name, crc_orig, crc_calc);

		if (crc_calc != crc_orig) {
			return -1;
		}
	}

	return 0;
}

#ifdef CONFIG_OTA_FILE_PATCH
static int ota_is_patch_fw(struct ota_upgrade_info *ota)
{
	const struct fw_version *old_fw_ver = &ota->manifest.old_fw_ver;

	return (old_fw_ver->version_code == 0) ? 0 : 1;
}

static int ota_write_file_by_patch(struct ota_upgrade_info *ota, struct ota_file *file, int start_file_offs)
{
	struct ota_image *img = ota->img;
	struct ota_storage *storage = ota->storage;
	unsigned int img_file_offset;
	int err, is_clean, patch_file_size;
	u32_t start_time, consume_time;
	struct ota_file_patch_info file_patch;
	const struct partition_entry *part;
	void *mapping_addr;

	SYS_LOG_INF("write file %s by patch to offset 0x%x", file->name, file->offset);

	start_time = k_uptime_get_32();

	if (start_file_offs != 0) {
		SYS_LOG_ERR("cannot support breakpoint for file patch by now");
		return -EINVAL;
	}

	img_file_offset = ota_image_get_file_offset(img, file->name);
	if (img_file_offset < 0) {
		SYS_LOG_ERR("cannot found file %s in image", file->name);
		return err;
	}

	patch_file_size = ota_image_get_file_length(img, file->name);

	part = partition_get_part(file->file_id);
	if (part == NULL)
		return -EINVAL;

	/* check empty */
	printk("file->size 0x%x, ota->data_buf %p, data_buf_size 0x%x, part->flag 0x%x\n",
		file->size, ota->data_buf, ota->data_buf_size, part->flag);
	is_clean = ota_storage_is_clean(storage, file->offset, file->size,
		ota->data_buf, ota->data_buf_size);
	if (is_clean != 1) {
		SYS_LOG_ERR("storage is not clean, offs 0x%x size 0x%x", file->offset, file->size);
		return -EINVAL;
	}

	ota_breakpoint_update_file_state(&ota->bp, file, OTA_BP_FILE_STATE_WRITING_DIRTY, 0, 0);

	mapping_addr = soc_memctrl_create_temp_mapping(part->file_offset, part->flag & PARTITION_FLAG_ENABLE_CRC);

	memset(&file_patch, 0x0, sizeof(struct ota_file_patch_info));

	file_patch.img = img;
	file_patch.storage = storage;
	file_patch.old_file_mapping_addr = mapping_addr;
	file_patch.old_file_offset = part->file_offset;
	file_patch.old_file_size = part->size;
	file_patch.new_file_offset = file->offset; // + start_file_offs;
	file_patch.new_file_size = file->size;
	file_patch.patch_file_offset = img_file_offset;
	file_patch.patch_file_size = patch_file_size;
	file_patch.flag_use_crc = (part->flag & PARTITION_FLAG_ENABLE_CRC) ? 1 : 0;
	file_patch.flag_use_encrypt = (part->flag & PARTITION_FLAG_ENABLE_ENCRYPTION) ? 1 : 0;

	file_patch.write_cache = ota->data_buf;
	file_patch.write_cache_size = 0x22;
	file_patch.write_cache_offs = 0;
	file_patch.write_cache_pos = 0;

	err = ota_file_patch_write(&file_patch);
	if (err) {
		SYS_LOG_ERR("storage write failed, offs 0x%x size 0x%x", file->offset, file->size);
		return -EIO;
	}

	consume_time = k_uptime_get_32() - start_time;
	SYS_LOG_INF("write file %s: length %d KB patch size(%d KB), consume %d ms, %d KB/s\n",
		file->name, file->size / 1024, patch_file_size / 1024,
		consume_time, file->size / consume_time);

	soc_memctrl_clear_temp_mapping(mapping_addr);

	return 0;
}
#endif

static int ota_write_file_normal(struct ota_upgrade_info *ota, struct ota_file *file, int start_file_offs)
{
	struct ota_image *img = ota->img;
	struct ota_storage *storage = ota->storage;
	struct ota_breakpoint *bp = &ota->bp;
	unsigned int offs, img_file_offset;
	int err, seg_size, file_len, wlen, is_clean;
	u32_t start_time, consume_time;
	bool is_record = false;

	SYS_LOG_INF("write file %s size 0x%x to offset 0x%x start_offset 0x%x",
		file->name, file->size, file->offset, start_file_offs);

	start_time = k_uptime_get_32();

	file_len = file->size;

	if (start_file_offs >= file_len) {
		SYS_LOG_ERR("file %s: start file offs 0x%x > file size 0x%x",
			file->name, start_file_offs, file_len);
		return -EINVAL;
	}

	offs = start_file_offs;

	if (strlen(file->name) == 0) {
		img_file_offset = ota_image_get_file_offset(img, NULL);
		if (ota_use_recovery(ota) && !ota_use_recovery_app(ota)) {
			if (!start_file_offs)
				offs += ota->xml_offset;
		}
	} else {
		img_file_offset = ota_image_get_file_offset(img, file->name);
	}
	if (img_file_offset < 0) {
		SYS_LOG_ERR("cannot found file %s in image", file->name);
		return err;
	}

	wlen = file_len - offs;
	seg_size = ota->data_buf_size;
	while (wlen > 0) {
		if (wlen < seg_size)
			seg_size = wlen;

		/* check empty */
		is_clean = ota_storage_is_clean(storage, file->offset + offs, seg_size,
			ota->data_buf, ota->data_buf_size);
		if (is_clean != 1) {
			SYS_LOG_ERR("storage is not clean, offs 0x%x size 0x%x", offs, seg_size);
#if 1 //tcf 2021/6/21 17:58
			ota_storage_erase(storage, file->offset + offs, seg_size);
#else
			return -EINVAL;
#endif
		}

		err = ota_image_read(img, img_file_offset + offs, ota->data_buf, seg_size);
		if (err) {
			SYS_LOG_ERR("cannot read data, offs 0x%x", offs);
			ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITING, offs, 1);
			return -EAGAIN;
		}

		if (!is_record) {
			ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITING, offs, 1);
			is_record = true;
		} else {
			ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITING, offs, 0);
		}

		err = ota_storage_write(storage, file->offset + offs, ota->data_buf, seg_size);
		if (err) {
			SYS_LOG_ERR("storage write failed, offs 0x%x", offs);
			return -EIO;
		}

		offs += seg_size;
		wlen -= seg_size;
	}

	consume_time = k_uptime_get_32() - start_time;
	SYS_LOG_INF("write file %s: length %d KB, consume %d ms, %d KB/s\n", file->name, file_len / 1024,
		consume_time, file_len / consume_time);

	return 0;
}

static int ota_write_file(struct ota_upgrade_info *ota, struct ota_file *file, int start_file_offs)
{
#ifdef CONFIG_OTA_FILE_PATCH
	if (ota_is_patch_fw(ota)) {
		return ota_write_file_by_patch(ota, file, start_file_offs);
	} else {
#endif
		return ota_write_file_normal(ota, file, start_file_offs);
#ifdef CONFIG_OTA_FILE_PATCH
	}
#endif
}

static int ota_write_and_verify_file(struct ota_upgrade_info *ota,
				     const struct partition_entry *part,
				     struct ota_file *file, bool need_verify)
{
	struct ota_breakpoint *bp = &ota->bp;
	int bp_file_state, start_write_offset = 0;
	int err = 0, cur_storage_id, need_erase = 0;

	bp_file_state = ota_breakpoint_get_file_state(bp, file->file_id);

	SYS_LOG_INF("file %s: file_id %d, bp file state %d",
		file->name, file->file_id, bp_file_state);

	switch (bp_file_state) {
	case OTA_BP_FILE_STATE_WRITE_DONE:
	case OTA_BP_FILE_STATE_VERIFY_PASS:
		SYS_LOG_INF("file %s: file_id %d, already write done\n",
			file->name, file->file_id);
		break;
	case OTA_BP_FILE_STATE_CLEAN:
		SYS_LOG_INF("file %s: file_id %d, part is clean\n",
			file->name, file->file_id);
		break;
	case OTA_BP_FILE_STATE_WRITING_CLEAN:
		SYS_LOG_INF("file %s: file_id %d, part is writing clean, write offset 0x%x\n",
			file->name, file->file_id, bp->cur_file_write_offset);
		start_write_offset = bp->cur_file_write_offset;
		break;
	case OTA_BP_FILE_STATE_WRITING:
		SYS_LOG_INF("file %s: file_id %d, part is writing not clean! , write_offset 0x%x\n",
			file->name, file->file_id, bp->cur_file_write_offset);
		start_write_offset = bp->cur_file_write_offset;
		need_erase = 1;
		break;
	default:
		SYS_LOG_INF("file %s: file_id %d, write offset 0 by default\n",
			file->name, file->file_id);
		need_erase = 1;
		break;
	}

	cur_storage_id = ota_storage_get_storage_id(ota->storage);
	if (part->storage_id != cur_storage_id) {
		SYS_LOG_ERR("BUG: file_id %d storage_id %d not current storage_id %d",
			part->file_id, part->storage_id, cur_storage_id);
		err = -EINVAL;
		goto failed;
	}

	if (ota_use_recovery(ota)) {
		/* we can erase flash in recovery app */
		if (need_erase) {
			int erase_offset;

			if (!ota_use_recovery_app(ota)) {
				/* cannot erase flash if not in recovery app or single nor */
				if (cur_storage_id == 0) {
					SYS_LOG_INF("update file_id %d: storage %d is xip, skip erase\n",
						cur_storage_id, file->file_id);
					goto skip_erase;
				}
			}

			erase_offset = ROUND_DOWN(file->offset + start_write_offset, OTA_ERASE_ALIGN_SIZE);
			start_write_offset = erase_offset - file->offset;

			ota_partition_erase_part(ota, part, erase_offset - part->offset);

			SYS_LOG_INF("update file_id %d write_offset from 0x%x to 0x%x\n",
				file->file_id, bp->cur_file_write_offset, start_write_offset);
			bp->cur_file_write_offset = start_write_offset;
		}
	}
skip_erase:

	if (bp_file_state != OTA_BP_FILE_STATE_WRITE_DONE &&
	    bp_file_state != OTA_BP_FILE_STATE_VERIFY_PASS) {
		ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITE_START,
						 start_write_offset, 0);

		err = ota_write_file(ota, file, start_write_offset);
		if (err) {
			SYS_LOG_ERR("failed to write file %s",
				file->name);
			goto failed;
		}

		ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITE_DONE, 0, 0);
	}

	if (need_verify) {
		err = ota_verify_file(ota, file);
		if (err) {
			SYS_LOG_ERR("file %s, verify failed", file->name);
			ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_VERIFY_FAIL, 0, 0);
			goto failed;
		}

		SYS_LOG_INF("file %s, verify pass", file->name);
		ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_VERIFY_PASS, 0, 0);
	}

	return 0;

failed:
	if (err != -EIO && err != -EAGAIN) {
		/* we assume -EIO error that can be resumed */
		ota_breakpoint_update_file_state(bp, file, OTA_BP_FILE_STATE_WRITE_FAIL, 0, 0);
	}

	return err;
}

static int ota_upgrade_verify_along(struct ota_upgrade_info *ota)
{
	const struct partition_entry *part;
	struct ota_manifest *manifest = &ota->manifest;
	struct ota_file *file;
	int i, err;
	int cur_file_id;

	for (i = 0; i < manifest->file_cnt; i++) {
		file = &manifest->wfiles[i];

		part = partition_get_mirror_part(file->file_id);
		if (part == NULL) {
			SYS_LOG_INF("cannt found mirror part entry for file_id %d",
				file->file_id);

			if (ota_use_recovery_app(ota)) {
				cur_file_id = partition_get_current_file_id();
				part = partition_get_part(file->file_id);
				if (cur_file_id == file->file_id || part == NULL) {
					SYS_LOG_ERR("cannt found part entry for file_id %d, cur_file_id %d",
						file->file_id, cur_file_id);
					return -EINVAL;
				}
				SYS_LOG_INF("found part entry for file_id %d, cur_file_id %d",
					file->file_id, cur_file_id);
			} else {
				return -EINVAL;
			}
		}

		/* ignore boot partition */
		if (partition_is_boot_part(part))
			continue;

		if (partition_is_param_part(part))
			continue;

		err = ota_verify_file(ota, file);
		if (err) {
			SYS_LOG_ERR("file %s, verify failed", file->name);
			ota_breakpoint_update_file_state(&ota->bp, file, OTA_BP_FILE_STATE_VERIFY_FAIL, 0, 0);
			return -1;
		}

		SYS_LOG_INF("file %s, verify pass", file->name);
		ota_breakpoint_update_file_state(&ota->bp, file, OTA_BP_FILE_STATE_VERIFY_PASS, 0, 0);
	}

	return 0;
}

static int ota_auto_update_version(struct ota_upgrade_info *ota,
				     const struct partition_entry *part,
				     struct ota_file *file)
{
	struct ota_storage *storage = ota->storage;
	const struct fw_version *cur_ver;
	struct fw_version *new_ver;
	u32_t start_time, consume_time;
	u32_t addr, len = file->size, wlen;
	u8_t *param_ptr, *param_map_ptr;

	SYS_LOG_INF("write file %s len %d to offset 0x%x by auto update version",
				file->name, len, file->offset);

	start_time = k_uptime_get_32();

	cur_ver = (struct fw_version *)fw_version_get_current();

	param_ptr = (u8_t *)mem_malloc(file->size);
	if (!param_ptr) {
		SYS_LOG_INF("failed to malloc size %d", file->size);
		return -ENOMEM;
	}

	param_map_ptr = soc_memctrl_create_temp_mapping(file->offset, false);
	memcpy(param_ptr, param_map_ptr, file->size);
	soc_memctrl_clear_temp_mapping(param_map_ptr);

	ota_partition_erase_part(ota, part, 0);

	new_ver = (struct fw_version *)(param_ptr + SOC_BOOT_FIRMWARE_VERSION_OFFSET);
	/* Allow ota upgrade even though new ota version is bigger than the current's */
	if (new_ver->version_code > cur_ver->version_code) {
		SYS_LOG_WRN("new fw version 0x%x is bigger than current's 0x%x",
			new_ver->version_code, cur_ver->version_code);
	}
	new_ver->version_code = cur_ver->version_code + 1;
	new_ver->checksum = utils_crc32(0, (const u8_t *)new_ver, sizeof(struct fw_version) - 4);

	SYS_LOG_INF("current fw version: 0x%x", cur_ver->version_code);
	SYS_LOG_INF("current fw version name: %s", cur_ver->version_name);
	SYS_LOG_INF("new fw version: 0x%x", new_ver->version_code);
	SYS_LOG_INF("new fw version name: %s", new_ver->version_name);

	addr = file->offset;
	/* enable encryption function */
	if (part->flag & PARTITION_FLAG_ENABLE_ENCRYPTION) {
		SYS_LOG_INF("enable encryption write");
		addr |= (1 << 31);
		if (len % 32) {
			SYS_LOG_ERR("len %d shall align with 32 bytes", len);
			return -EINVAL;
		}
	}

	wlen = 32;
	while (len) {
		if (len < wlen)
			wlen = len;
		if (ota_storage_write(storage, addr, param_ptr, wlen)) {
			SYS_LOG_ERR("storage write failed, offs 0x%x", addr);
			mem_free(new_ver);
			return -EFAULT;
		}
		param_ptr += wlen;
		addr += wlen;
		len -= wlen;
	}

	consume_time = k_uptime_get_32() - start_time;
	SYS_LOG_INF("write file %s: length %d KB, consume %d ms, %d KB/s\n", file->name, len / 1024,
				consume_time, len / consume_time);

	mem_free(new_ver);
	return 0;
}

static int ota_do_upgrade(struct ota_upgrade_info *ota)
{
	const struct partition_entry *part, *boot_part = NULL, *param_part = NULL;
	struct ota_manifest *manifest = &ota->manifest;
	struct ota_file *file, *boot_file = NULL, *param_file = NULL;
	int i, err, max_file_size;
	int cur_file_id;

	SYS_LOG_INF("ota file_cnt %d", manifest->file_cnt);

	for (i = 0; i < manifest->file_cnt; i++) {
		file = &manifest->wfiles[i];

		part = partition_get_mirror_part(file->file_id);
		if (part == NULL) {
			SYS_LOG_INF("cannt found mirror part entry for file_id %d",
				file->file_id);

			if (ota_use_recovery_app(ota)) {
				cur_file_id = partition_get_current_file_id();
				part = partition_get_part(file->file_id);
				if (cur_file_id == file->file_id || part == NULL) {
					SYS_LOG_ERR("cannt found part entry for file_id %d, cur_file_id %d",
						file->file_id, cur_file_id);
					return -EINVAL;
				}
				SYS_LOG_INF("found part entry for file_id %d, cur_file_id %d",
					file->file_id, cur_file_id);
			} else {
				return -EINVAL;
			}
		}

		max_file_size = partition_get_max_file_size(part);
		if (file->size > max_file_size) {
			SYS_LOG_ERR("part %s: file size 0x%x > part max file size 0x%x",
				part->name, file->size, max_file_size);
			return -EINVAL;
		}

		SYS_LOG_INF("[%d]: file %s, file_id %d write to nor addr 0x%x",
			i, file->name, file->file_id, part->file_offset);
		file->offset = part->file_offset;

		if (partition_is_boot_part(part)) {
			boot_file = file;
			boot_part = part;
			continue;
		}

		if (partition_is_param_part(part)) {
			param_file = file;
			param_part = part;
			continue;
		}

		err = ota_write_and_verify_file(ota, part, file, false);
		if (err) {
			return err;
		}
	}

	err = ota_upgrade_verify_along(ota);
	if (err) {
		return err;
	}

	/* write boot file at secondly last */
	if (boot_file && boot_part) {
		err = ota_write_and_verify_file(ota, boot_part, boot_file, true);
		if (err) {
			return err;
		}
	}

	/* write param file at last */
	if (param_file && param_part) {
		err = ota_write_and_verify_file(ota, param_part, param_file, true);
		if (err) {
			return err;
		}
		if (ota_use_no_version_control(ota)) {
			err = ota_auto_update_version(ota, param_part, param_file);
			if (err) {
				return err;
			}
		}
	}

	return 0;
}

static int ota_write_temp_img(struct ota_upgrade_info *ota)
{
	struct ota_image *img = ota->img;
	const struct partition_entry *temp_part;
	int err;
	struct ota_file tmp_file;
	struct ota_file *file;

	file = &tmp_file;
	memset(file, 0x0, sizeof(struct ota_file));
	file->size = ota_image_get_file_length(img, NULL);
	file->file_id = PARTITION_FILE_ID_OTA_TEMP;

	temp_part = partition_get_temp_part();
	if (temp_part == NULL) {
		SYS_LOG_ERR("cannot found temp partition to store ota fw");
		return -EINVAL;
	}

	if (file->size >= temp_part->size) {
		SYS_LOG_ERR("temp partition size 0x%x is too small, ota fw size 0x%x",
			temp_part->size, file->size);
		return -EINVAL;
	}

	file->offset = temp_part->offset;

	SYS_LOG_INF("file %s, file_id %d write to nor addr 0x%x",
		strlen(file->name) ? (const char *)file->name : (const char *)"<NULL>", file->file_id, file->offset);

	err = ota_write_and_verify_file(ota, temp_part, file, true);
	if (err) {
		SYS_LOG_ERR("failed to write ota image");
		return err;
	}

	return 0;
}

static int ota_is_need_upgrade(struct ota_upgrade_info *ota)
{
	struct ota_breakpoint *bp = &ota->bp;
	const struct fw_version *cur_ver, *img_ver;
	struct ota_backend *backend;
	int backend_type;

#ifdef CONFIG_OTA_FILE_PATCH
	const struct fw_version *patch_old_ver;
	patch_old_ver = &ota->manifest.old_fw_ver;

	SYS_LOG_INF("OTA patch old fw version:");
	fw_version_dump(patch_old_ver);
#endif

	img_ver = &ota->manifest.fw_ver;
	cur_ver = fw_version_get_current();

	SYS_LOG_INF("ota fw version:");
	fw_version_dump(img_ver);

	SYS_LOG_INF("current fw version:");
	fw_version_dump(cur_ver);

	backend = ota_image_get_backend(ota->img);
	backend_type = ota_backend_get_type(backend);

	if (backend_type != OTA_BACKEND_TYPE_TEMP_PART &&
	    bp->backend_type != OTA_BACKEND_TYPE_UNKNOWN &&
	    bp->backend_type != backend_type) {
		SYS_LOG_ERR("backend type is chagned(%d -> %d), need erase old firmware",
			bp->backend_type, ota_backend_get_type(backend));
		return -1;
	}

	if (strcmp(cur_ver->board_name, img_ver->board_name)) {
		/* skip */
		SYS_LOG_ERR("unmatched board name, skip ota");
		return -1;
	}

#ifdef CONFIG_OTA_FILE_PATCH
	if (ota_is_patch_fw(ota)) {
		/* validate ota patch firmware version */
		if (cur_ver->version_code != patch_old_ver->version_code) {
			SYS_LOG_ERR("unmatched fw ver, curr 0x%x but OTA patch old ver is 0x%x",
				cur_ver->version_code, ota->manifest.old_fw_ver.version_code);
			return -1;
		}

		if (ota_use_no_version_control(ota)) {
			SYS_LOG_ERR("Patch FW only support with version control");
			return -1;
		}
	}
#endif

	if ((bp->state == OTA_BP_STATE_WRITING_IMG ||
	     bp->state == OTA_BP_STATE_UPGRADE_WRITING ||
	     bp->state == OTA_BP_STATE_UPGRADE_PENDING) &&
	     (bp->new_version != 0 &&
	     bp->new_version != img_ver->version_code)) {
		/* FIXME: has new version fw, need erase partition */
		SYS_LOG_INF("has new version fw, need erase old firmware");
		return -1;
	}

	if (!ota_use_no_version_control(ota)) {
		if (cur_ver->version_code >= img_ver->version_code) {
			/* skip */
			SYS_LOG_INF("ota image is same or older, skip ota");
			return 0;
		}
	}

	return 1;
}

static int ota_upgrade_write_xml(struct ota_upgrade_info *ota)
{
	u8_t *fw_head = NULL, *manifest_data;
	u32_t fw_len, manifest_len;
	const struct partition_entry *temp_part;
	struct ota_breakpoint *bp = &ota->bp;
	int err;

	temp_part = partition_get_temp_part();
	if (temp_part == NULL) {
		SYS_LOG_ERR("cannot found temp partition to store ota fw");
		return -EINVAL;
	}

	SYS_LOG_INF("bp->state %d", bp->state);

	if (bp->state == OTA_BP_STATE_UPGRADE_WRITING ||
		bp->state == OTA_BP_STATE_WRITING_IMG) {
		SYS_LOG_INF("skip write xml");
		return 0;
	}

	fw_head = ota_image_get_fw_head(ota->img, &fw_len);
	if (fw_head) {
		if (fw_len >= temp_part->size) {
			SYS_LOG_ERR("temp partition size 0x%x is too small 0x%x", temp_part->size, fw_len);
			return -EINVAL;
		}

		if (ota_storage_is_clean(ota->storage, temp_part->offset, fw_len,
			ota->data_buf, ota->data_buf_size) != 1) {
			SYS_LOG_ERR("storage is not clean, offs 0x%x size 0x%x", temp_part->offset, fw_len);
			return -EINVAL;
		}

		err = ota_storage_write(ota->storage, temp_part->offset, fw_head, fw_len);
		if (err) {
			SYS_LOG_ERR("storage write failed, offs 0x%x", temp_part->offset);
			return -EIO;
		}
	}

	manifest_data = ota_manifest_get_data(&ota->manifest, &manifest_len);
	if (manifest_data && fw_head) {
		if ((fw_len + manifest_len) >= temp_part->size) {
			SYS_LOG_ERR("temp partition size 0x%x is too small 0x%x", temp_part->size, fw_len + manifest_len);
			return -EINVAL;
		}

		if (ota_storage_is_clean(ota->storage, temp_part->offset + fw_len, manifest_len,
			ota->data_buf, ota->data_buf_size) != 1) {
			SYS_LOG_ERR("storage is not clean, offs 0x%x size 0x%x",
						temp_part->offset + fw_len, manifest_len);
			return -EINVAL;
		}

		err = ota_storage_write(ota->storage, temp_part->offset + fw_len,
								manifest_data, manifest_len);
		if (err) {
			SYS_LOG_ERR("storage write failed, offs 0");
			return -EIO;
		}
	}

	ota->xml_offset = fw_len + manifest_len;
	SYS_LOG_INF("write xml offset 0x%x", ota->xml_offset);

	return 0;
}

static int ota_upgrade_statistics(struct ota_upgrade_info *ota)
{
	const struct partition_entry *part;
	struct ota_manifest *manifest = &ota->manifest;
	struct ota_file *file;
	struct ota_breakpoint *bp = &ota->bp;
	int i, bp_file_state, start_write_offset = 0;
	int cur_file_id;
	u32_t total_size = 0;

	if (!ota_use_recovery(ota) || ota_use_recovery_app(ota)) {
		for (i = 0; i < manifest->file_cnt; i++) {
			file = &manifest->wfiles[i];
			start_write_offset = 0;
			part = partition_get_mirror_part(file->file_id);
			if (part == NULL) {
				SYS_LOG_INF("cannt found mirror part entry for file_id %d",
					file->file_id);

				if (ota_use_recovery_app(ota)) {
					cur_file_id = partition_get_current_file_id();
					part = partition_get_part(file->file_id);
					if (cur_file_id == file->file_id || part == NULL) {
						SYS_LOG_ERR("cannt found part entry for file_id %d, cur_file_id %d",
							file->file_id, cur_file_id);
						return -EINVAL;
					}
					SYS_LOG_INF("found part entry for file_id %d, cur_file_id %d",
						file->file_id, cur_file_id);
				} else {
					return -EINVAL;
				}
			}

			bp_file_state = ota_breakpoint_get_file_state(bp, file->file_id);
			if (bp_file_state != OTA_BP_FILE_STATE_WRITE_DONE &&
	    		bp_file_state != OTA_BP_FILE_STATE_VERIFY_PASS) {
				if (bp_file_state == OTA_BP_FILE_STATE_WRITING_CLEAN
					|| bp_file_state == OTA_BP_FILE_STATE_WRITING)
					start_write_offset = bp->cur_file_write_offset;
				total_size += (file->size - start_write_offset);
			}

			SYS_LOG_INF("ota file[%d]%s: total size %d, bp offset %d",
				file->file_id, file->name, file->size, start_write_offset);
		}
	} else {
		part = partition_get_temp_part();
		if (part == NULL) {
			SYS_LOG_ERR("cannot found temp partition to store ota fw");
			return -EINVAL;
		}
		bp_file_state = ota_breakpoint_get_file_state(bp, PARTITION_FILE_ID_OTA_TEMP);
		if (bp_file_state != OTA_BP_FILE_STATE_WRITE_DONE &&
    		bp_file_state != OTA_BP_FILE_STATE_VERIFY_PASS) {
			if (bp_file_state == OTA_BP_FILE_STATE_WRITING_CLEAN
				|| bp_file_state == OTA_BP_FILE_STATE_WRITING)
				start_write_offset = bp->cur_file_write_offset;
			int temp_file_size = ota_image_get_file_length(ota->img, NULL);
			total_size += (temp_file_size - start_write_offset);
		}
	}

	if (total_size)
		ota_image_progress_on(ota->img, total_size);

	return 0;
}

int ota_upgrade_check(struct ota_upgrade_info *ota)
{
	struct ota_breakpoint *bp = &ota->bp;
	struct ota_backend *backend;
	int err, need_upgrade;

	SYS_LOG_INF("handle upgrade");

	if (ota->state != OTA_INIT) {
		SYS_LOG_ERR("ota state <%d> is not OTA_INIT, skip upgrade", ota->state);
		return -EINVAL;
	}

	err = ota_image_open(ota->img);
	if (err) {
		SYS_LOG_INF("ota image open failed");
		return -EIO;
	}

	ota->data_buf = mem_malloc(ota->data_buf_size);
	if (!ota->data_buf) {
		SYS_LOG_ERR("faield to allocate %d bytes", ota->data_buf_size);
		return -ENOMEM;
	}

	if (ota_use_recovery_app(ota)) {
		/* only check data in recovery app to save time */
		err = ota_image_check_data(ota->img);
		if (err) {
			SYS_LOG_ERR("bad data crc");
			return -EINVAL;
		}
	}

	err = ota_manifest_parse_file(&ota->manifest, ota->img, OTA_MANIFESET_FILE_NAME);
	if (err) {
		SYS_LOG_INF("cannot get manifest file in image");
		err = -EAGAIN;
		goto exit;
	}

	ota_upgrade_statistics(ota);

	/* need upgrade? */
	need_upgrade = ota_is_need_upgrade(ota);
	if (need_upgrade <= 0) {
		SYS_LOG_INF("skip upgrade");
		ota_image_release_fw_head(ota->img);
		ota_manifest_release_data(&ota->manifest);
		ota_breakpoint_update_state(bp, OTA_BP_STATE_WRITING_IMG_FAIL);
		err = -EAGAIN;
		goto exit;
	}

	SYS_LOG_INF("burn firmware image");

	if (ota_use_recovery(ota) && !ota_use_recovery_app(ota))
		err = ota_upgrade_write_xml(ota);

	ota_image_release_fw_head(ota->img);
	ota_manifest_release_data(&ota->manifest);
	if (err) {
		SYS_LOG_ERR("can not write xml err=%d", err);
		goto exit;
	}

	backend = ota_image_get_backend(ota->img);

	/* update breakpoint for new firmware */
	bp->backend_type = ota_backend_get_type(backend);
	bp->new_version = ota->manifest.fw_ver.version_code;

	ota_update_state(ota, OTA_RUNNING);

	if (!ota_use_recovery(ota) || ota_use_recovery_app(ota)) {
		ota_breakpoint_update_state(bp, OTA_BP_STATE_UPGRADE_WRITING);
		err = ota_do_upgrade(ota);
		if (err) {
			SYS_LOG_INF("upgrade failed, err %d", err);
			if (err != -EIO && err != -EAGAIN) {
				ota_breakpoint_update_state(bp, OTA_BP_STATE_UPGRADING_FAIL);
			}

			goto exit;
		}

		ota_breakpoint_update_state(bp, OTA_BP_STATE_UPGRADE_DONE);
	} else {
		ota_breakpoint_update_state(bp, OTA_BP_STATE_WRITING_IMG);
		err = ota_write_temp_img(ota);
		if (err) {
			SYS_LOG_INF("write ota image failed, err %d", err);
			if (err != -EIO && err != -EAGAIN) {
				ota_breakpoint_update_state(bp, OTA_BP_STATE_WRITING_IMG_FAIL);
			}

			goto exit;
		}

		ota_breakpoint_update_state(bp, OTA_BP_STATE_UPGRADE_PENDING);
	}

	SYS_LOG_INF("upgrade successfully!");

	ota_image_report_progress(ota->img, 0, 1);
	ota_image_ioctl(ota->img, OTA_BACKEND_IOCTL_REPORT_IMAGE_VALID, 1);
	ota_update_state(ota, OTA_DONE);

exit:
	if (err) {
		ota_image_ioctl(ota->img, OTA_BACKEND_IOCTL_REPORT_IMAGE_VALID, 0);
		ota_update_state(ota, OTA_FAIL);
		if (err == -EAGAIN) {
			/* wait for upgrade resume */
			SYS_LOG_INF("ota status -> OTA_INIT, wait for upgrading resume!");
			ota_update_state(ota, OTA_INIT);
		}
	}

	if (ota->data_buf) {
		mem_free(ota->data_buf);
		ota->data_buf = NULL;
	}

	ota_image_close(ota->img);

	return err;
}

int ota_upgrade_attach_backend(struct ota_upgrade_info *ota, struct ota_backend *backend)
{
	struct ota_backend *img_backend = ota_image_get_backend(ota->img);

	SYS_LOG_INF("attach backend type %d", backend->type);

	if (img_backend != NULL && img_backend->type != backend->type) {
		SYS_LOG_ERR("already attached backend %d %d", img_backend->type, backend->type);
		return -EBUSY;
	}

	ota_image_bind(ota->img, backend);

	return 0;
}

void ota_upgrade_detach_backend(struct ota_upgrade_info *ota, struct ota_backend *backend)
{
	struct ota_backend *img_backend = ota_image_get_backend(ota->img);

	SYS_LOG_INF("detach backend %p", backend);

	if (img_backend == backend)
		ota_image_unbind(ota->img, backend);
}

int ota_upgrade_is_in_progress(struct ota_upgrade_info *ota)
{
	struct ota_breakpoint *bp = &ota->bp;
	int bp_state;

	bp_state = ota_breakpoint_get_current_state(bp);
	switch (bp_state) {
	case OTA_BP_STATE_UPGRADE_PENDING:
	case OTA_BP_STATE_UPGRADE_WRITING:
	case OTA_BP_STATE_UPGRADE_DONE:
		return 1;
	default:
		break;
	}

	return 0;
}
static struct ota_upgrade_info global_ota_upgrade_info;
struct ota_upgrade_info *ota_upgrade_init(struct ota_upgrade_param *param)
{
	struct ota_upgrade_info *ota;

	SYS_LOG_INF("init");

	ota = &global_ota_upgrade_info;

	memset(ota, 0x0, sizeof(struct ota_upgrade_info));

	if (param->no_version_control) {
		SYS_LOG_INF("enable no version control");
		ota->flags |= OTA_FLAG_USE_NO_VERSION_CONTROL;
	}

	/* allocate data buffer later */
	ota->data_buf_size = OTA_DATA_BUFFER_SIZE;

	ota->storage = ota_storage_init(param->storage_name);
	if (!ota->storage) {
		SYS_LOG_INF("storage open err");
		return NULL;
	}

	if (param->flag_use_recovery) {
		ota->flags |= OTA_FLAG_USE_RECOVERY;
	}

	if (param->flag_use_recovery_app) {
		if (!param->flag_use_recovery) {
			SYS_LOG_ERR("invalid flag_is_recovery_app");
			return NULL;
		}

		ota->flags |= OTA_FLAG_USE_RECOVERY_APP;
	}

	ota_breakpoint_init(&ota->bp);

	ota_partition_update_prepare(ota);

	ota->img = ota_image_init();
	if (!ota->img) {
		SYS_LOG_ERR("image init failed");
		return NULL;
	}

	ota->notify = param->notify;

	ota_update_state(ota, OTA_INIT);

	return ota;
}

void ota_upgrade_exit(struct ota_upgrade_info *ota)
{
	SYS_LOG_INF("exit");

	/* TODO */

	if (ota) {
		if (ota->img)
			ota_image_exit(ota->img);

		if (ota->storage)
			ota_storage_exit(ota->storage);
	}
}
