/*
 * Copyright (c) 2018 Actions Semiconductor Co., Ltd
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file media service config interface
 */
#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <zephyr.h>

#define TWS_START_PLAY_DELAY_CLOCK_LOCAL_NORMAL    	(380)
#define TWS_START_PLAY_DELAY_CLOCK_BT_LOW_LATENCY   (200)
#define TWS_START_PLAY_DELAY_CLOCK_BT_NORMAL    	(140)
#define TWS_START_PLAY_DELAY_CLOCK_AUX_LOW_LATENCY  (80)
#define TWS_START_PLAY_DELAY_CLOCK_AUX_NORMAL  		(120)

const uint32_t delay_clock_table[5][2] = {
	/* Normal,  low latencey */
	{TWS_START_PLAY_DELAY_CLOCK_BT_NORMAL, TWS_START_PLAY_DELAY_CLOCK_BT_NORMAL},			/* TWS_MODE_SINGLE */
	{TWS_START_PLAY_DELAY_CLOCK_BT_NORMAL, TWS_START_PLAY_DELAY_CLOCK_BT_LOW_LATENCY},		/* TWS_MODE_BT_TWS */
	{TWS_START_PLAY_DELAY_CLOCK_AUX_NORMAL, TWS_START_PLAY_DELAY_CLOCK_AUX_LOW_LATENCY},	/* TWS_MODE_AUX_TWS */
	{TWS_START_PLAY_DELAY_CLOCK_LOCAL_NORMAL, TWS_START_PLAY_DELAY_CLOCK_LOCAL_NORMAL},		/* TWS_MODE_MUSIC_TWS */
	{TWS_START_PLAY_DELAY_CLOCK_AUX_NORMAL, TWS_START_PLAY_DELAY_CLOCK_AUX_LOW_LATENCY}	/* TWS_MODE_USOUND_TWS */
};