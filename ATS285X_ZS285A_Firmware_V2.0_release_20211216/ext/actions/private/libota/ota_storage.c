/*
 * Copyright (c) 2019 Actions Semiconductor Co., Ltd
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief OTA storage interface
 */

#include <kernel.h>
#include <flash.h>
#include <string.h>
#include <logging/sys_log.h>
#include <mem_manager.h>
#include "ota_storage.h"

#define XIP_DEV_NAME	CONFIG_XSPI_NOR_ACTS_DEV_NAME

struct ota_storage
{
	struct device *dev;
	const char *dev_name;
	int max_write_seg;
	int storage_id;		/* code run on this device? */
};

void ota_storage_set_max_write_seg(struct ota_storage *storage, int max_write_seg)
{
	if (max_write_seg <= 0)
		return;

	storage->max_write_seg = max_write_seg;
}

int ota_storage_get_storage_id(struct ota_storage *storage)
{
	return storage->storage_id;
}

int ota_storage_write(struct ota_storage *storage, int offs,
		      u8_t *buf, int size)
{
	int wlen, err;

	SYS_LOG_INF("offs 0x%x, buf %p, size %d", offs, buf, size);

	wlen = storage->max_write_seg;

	while (size > 0) {
		if (size < storage->max_write_seg)
			wlen = size;

		err = flash_write(storage->dev, offs, buf, wlen);
		if (err < 0) {
			SYS_LOG_ERR("write error %d, offs 0x%x, buf %p, size %d", err, offs, buf, size);
			return -EIO;
		}

		offs += wlen;
		buf += wlen;
		size -= wlen;
	}

	return 0;
}

int ota_storage_read(struct ota_storage *storage, int offs,
		     u8_t *buf, int size)
{
	int err;
	int rlen = OTA_STORAGE_DEFAULT_READ_SEGMENT_SIZE;

	SYS_LOG_INF("offs 0x%x, buf %p, size %d", offs, buf, size);

	while (size > 0) {
		if (size < OTA_STORAGE_DEFAULT_READ_SEGMENT_SIZE)
			rlen = size;

		err = flash_read(storage->dev, offs, buf, rlen);
		if (err < 0) {
			SYS_LOG_ERR("read error %d, offs 0x%x, buf %p, size %d", err, offs, buf, size);
			return -EIO;
		}

		offs += rlen;
		buf += rlen;
		size -= rlen;
	}

	return 0;
}

int ota_storage_is_clean(struct ota_storage *storage, int offs, int size,
			u8_t *buf, int buf_size)
{
	int i, err, read_size;
	u32_t *wptr = NULL;
	u8_t *cptr;

	//SYS_LOG_INF("offs 0x%x, size %d", offs, size);

	if (((unsigned int)buf & 0x3) || (buf_size & 0x3)) {
		return -EINVAL;
	}

	read_size = (buf_size > OTA_STORAGE_DEFAULT_READ_SEGMENT_SIZE)?
			OTA_STORAGE_DEFAULT_READ_SEGMENT_SIZE : buf_size;
	while (size > 0) {
		if (size < read_size)
			read_size = size;

		err = flash_read(storage->dev, offs, buf, read_size);
		if (err) {
			SYS_LOG_ERR("read error 0x%x, offs 0x%x, size %d", err, offs, size);
			return -EIO;
		}

		wptr = (u32_t *)buf;
		for (i = 0; i < (read_size >> 2); i++) {
			if (*wptr++ != 0xffffffff)
				return 0;
		}

		offs += read_size;
		//buf += read_size;
		size -= read_size;
	}

	/* check unaligned data */
	cptr = (u8_t *)wptr;
	if (buf != cptr) {
		for (i = 0; i < (read_size & 0x3); i++) {
			if (*cptr++ != 0xff)
				return 0;
		}
	}

	return 1;
}

int ota_storage_erase(struct ota_storage *storage, int offs, int size)
{
	SYS_LOG_INF("offs 0x%x, size %d", offs, size);

	return flash_erase(storage->dev, offs, size);
}

static struct ota_storage global_ota_storage;

struct ota_storage *ota_storage_init(const char *storage_name)
{
	struct ota_storage *storage;
	struct device *nor_dev;

	SYS_LOG_INF("init storage %s\n", storage_name);

	nor_dev = device_get_binding(storage_name);
	if (!nor_dev) {
		SYS_LOG_ERR("cannot found storage device %s", storage_name);
		return NULL;
	}

	storage = &global_ota_storage;

	memset(storage, 0x0, sizeof(struct ota_storage));

	storage->dev = nor_dev;
	storage->dev_name = storage_name;
	storage->max_write_seg = OTA_STORAGE_DEFAULT_WRITE_SEGMENT_SIZE;

	if (strcmp(storage_name, CONFIG_XSPI_NOR_ACTS_DEV_NAME) == 0)
		storage->storage_id = 0;
	else
		storage->storage_id = 1;

	return storage;
}

void ota_storage_exit(struct ota_storage *storage)
{
	SYS_LOG_INF("exit");

	storage = NULL;
}
