/*
 * Copyright (c) 2019 Actions Semiconductor Co., Ltd
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief OTA storage interface
 */

#ifndef __OTA_STORAGE_H__
#define __OTA_STORAGE_H__

#include <device.h>

#define OTA_STORAGE_DEFAULT_WRITE_SEGMENT_SIZE		64
#define OTA_STORAGE_DEFAULT_READ_SEGMENT_SIZE		128

struct ota_storage;

struct ota_storage *ota_storage_init(const char *storage_name);

void ota_storage_exit(struct ota_storage *storage);

int ota_storage_read(struct ota_storage *storage, int offs,
		     u8_t *buf, int size);
int ota_storage_write(struct ota_storage *storage, int offs,
		      u8_t *buf, int size);
int ota_storage_erase(struct ota_storage *storage, int offs, int size);

int ota_storage_is_clean(struct ota_storage *storage, int offs, int size,
			u8_t *buf, int buf_size);

void ota_storage_set_max_write_seg(struct ota_storage *storage, int max_write_seg);

int ota_storage_get_storage_id(struct ota_storage *storage);

#endif /* __OTA_STORAGE_H__ */
