cmd_src/ota/ota_app_foreground.o := /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-gcc -Wp,-MMD,src/ota/.ota_app_foreground.o.d  -nostdinc -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include-fixed -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb  -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated -include /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated/autoconf.h  -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/lib/crypto/tinycrypt/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/fs/fat/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/audio -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/media -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/misc -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/network -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/stream -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/wechat -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/al -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips" -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips"/al -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include  -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/ota -Isrc/ota -DKERNEL -D__ZEPHYR__=1 -c -g -std=c99 -Wall -Wformat -Wformat-security -D_FORTIFY_SOURCE=2 -Wno-format-zero-length -Wno-main -ffreestanding -Werror -Os -fdiagnostics-color -fno-asynchronous-unwind-tables -fno-pic -fno-stack-protector -ffunction-sections -fdata-sections -Os -G0 -EL -gdwarf-2 -gstrict-dwarf -msoft-float -fno-common -minterlink-mips16 -mframe-header-opt -mips32r2 -mips16 -Wno-unused-but-set-variable -fno-reorder-functions -fno-defer-pop -Wno-pointer-sign -fno-strict-overflow -Werror=implicit-int   -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/include   -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/tool/   -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/btmusic/   -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/btcall/   -I/mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/ota/    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ota_app_foreground)"  -D"KBUILD_MODNAME=KBUILD_STR(ota_app_foreground)" -c -o src/ota/ota_app_foreground.o /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/ota/ota_app_foreground.c

source_src/ota/ota_app_foreground.o := /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/ota/ota_app_foreground.c

deps_src/ota/ota_app_foreground.o := \
    $(wildcard include/config/property.h) \
    $(wildcard include/config/dvfs.h) \
    $(wildcard include/config/ota/recovery.h) \
    $(wildcard include/config/ota/temp/part/dev/name.h) \
    $(wildcard include/config/xspi/nor/acts/dev/name.h) \
    $(wildcard include/config/ota/backend/sdcard.h) \
    $(wildcard include/config/ota/backend/uhost.h) \
    $(wildcard include/config/ota/backend/bluetooth.h) \
    $(wildcard include/config/ota/backend/uart.h) \
    $(wildcard include/config/dvfs/dynamic/level.h) \
    $(wildcard include/config/app/priority.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/kernel.h \
    $(wildcard include/config/kernel/debug.h) \
    $(wildcard include/config/coop/enabled.h) \
    $(wildcard include/config/preempt/enabled.h) \
    $(wildcard include/config/num/coop/priorities.h) \
    $(wildcard include/config/num/preempt/priorities.h) \
    $(wildcard include/config/object/tracing.h) \
    $(wildcard include/config/poll.h) \
    $(wildcard include/config/thread/monitor.h) \
    $(wildcard include/config/sys/clock/exists.h) \
    $(wildcard include/config/thread/stack/info.h) \
    $(wildcard include/config/thread/custom/data.h) \
    $(wildcard include/config/errno.h) \
    $(wildcard include/config/cpu/load/stat.h) \
    $(wildcard include/config/cpu/task/block/stat.h) \
    $(wildcard include/config/thread/timer.h) \
    $(wildcard include/config/cpu/load/debug.h) \
    $(wildcard include/config/main/stack/size.h) \
    $(wildcard include/config/idle/stack/size.h) \
    $(wildcard include/config/isr/stack/size.h) \
    $(wildcard include/config/system/workqueue/stack/size.h) \
    $(wildcard include/config/init/stacks.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/fp/sharing.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/sse.h) \
    $(wildcard include/config/tickless/kernel.h) \
    $(wildcard include/config/num/mbox/async/msgs.h) \
    $(wildcard include/config/multithreading.h) \
    $(wildcard include/config/cplusplus.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/zephyr/types.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdint.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/limits.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain/gcc.h \
    $(wildcard include/config/arm.h) \
    $(wildcard include/config/application/memory.h) \
    $(wildcard include/config/isa/thumb.h) \
    $(wildcard include/config/isa/thumb2.h) \
    $(wildcard include/config/isa/arm.h) \
    $(wildcard include/config/nios2.h) \
    $(wildcard include/config/riscv32.h) \
    $(wildcard include/config/xtensa.h) \
    $(wildcard include/config/mips.h) \
    $(wildcard include/config/arc.h) \
    $(wildcard include/config/csky.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain/common.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/sections.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/section_tags.h \
    $(wildcard include/config/xip.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/atomic.h \
    $(wildcard include/config/atomic/operations/builtin.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/errno.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/__assert.h \
    $(wildcard include/config/assert.h) \
    $(wildcard include/config/assert/level.h) \
    $(wildcard include/config/actions/trace.h) \
    $(wildcard include/config/assert/show/file/func.h) \
    $(wildcard include/config/assert/show/file.h) \
    $(wildcard include/config/assert/show/func.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/printk.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/inttypes.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/dlist.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/slist.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdbool.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/util.h \
    $(wildcard include/config/myfeature.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/kernel_version.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/drivers/rand32.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include/kernel_arch_thread.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sys_clock.h \
    $(wildcard include/config/sys/clock/hw/cycles/per/sec.h) \
    $(wildcard include/config/tickless/kernel/time/unit/in/micro/secs.h) \
    $(wildcard include/config/sys/clock/ticks/per/sec.h) \
    $(wildcard include/config/timer/reads/its/frequency/at/runtime.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/cpu.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/arch.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/exc.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/error.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/irq.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/irq.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sw_isr_table.h \
    $(wildcard include/config/irq/stat.h) \
    $(wildcard include/config/num/irqs.h) \
    $(wildcard include/config/gen/irq/start/vector.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/asm_inline.h \
    $(wildcard include/config/use/mips16e.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/sys_io.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sys_io.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/device.h \
    $(wildcard include/config/kernel/init/priority/default.h) \
    $(wildcard include/config/device/power/management.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/thread_timer.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/logging/sys_log.h \
    $(wildcard include/config/sys/log/default/level.h) \
    $(wildcard include/config/sys/log/override/level.h) \
    $(wildcard include/config/sys/log.h) \
    $(wildcard include/config/sys/log/ext/hook.h) \
    $(wildcard include/config/sys/log/show/color.h) \
    $(wildcard include/config/sys/log/show/tags.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include/mem_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/global_mem.h \
    $(wildcard include/config/app/stacksize.h) \
    $(wildcard include/config/mqtt/stacksize.h) \
    $(wildcard include/config/music/stacksize.h) \
    $(wildcard include/config/mediasrv/stacksize.h) \
    $(wildcard include/config/download/stacksize.h) \
    $(wildcard include/config/user/work/q.h) \
    $(wildcard include/config/user/work/q/stack/size.h) \
    $(wildcard include/config/used/mem/pool.h) \
    $(wildcard include/config/used/mem/slab.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/os_common_api.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/zephyr.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/msg_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/include/app_defines.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth/bt_manager.h \
    $(wildcard include/config/bt/max/br/conn.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream/stream.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth/btservice_api.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth/btservice_base.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth/btservice_tws_api.h \
    $(wildcard include/config/bt/a2dp/aac.h) \
    $(wildcard include/config/os/low/latency/mode.h) \
    $(wildcard include/config/bt/hfp/tws.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/sdp.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/uuid.h \
    $(wildcard include/config/bt/debug.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/conn.h \
    $(wildcard include/config/bt/smp.h) \
    $(wildcard include/config/bt/bredr.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/bluetooth.h \
    $(wildcard include/config/bt/rfcomm.h) \
    $(wildcard include/config/bt/avdtp.h) \
    $(wildcard include/config/bt/hfp/hf.h) \
    $(wildcard include/config/bt/hfp/ag.h) \
    $(wildcard include/config/bt/a2dp.h) \
    $(wildcard include/config/bt/avrcp.h) \
    $(wildcard include/config/bt/hid.h) \
    $(wildcard include/config/bt/rpa/timeout.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/string.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/bits/restrict.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/net/buf.h \
    $(wildcard include/config/net/buf/pool/usage.h) \
    $(wildcard include/config/net/buf/log.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/hci.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/crypto.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth/bt_manager_ble.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/gatt.h \
    $(wildcard include/config/bt/le/att.h) \
    $(wildcard include/config/bt/max/paired.h) \
    $(wildcard include/config/bt/max/br/paired.h) \
    $(wildcard include/config/bt/max/conn.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/sys/types.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/bluetooth/att.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/app_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/app_switch.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/srv_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/sys_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/sys_event.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/sys_wakelock.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota/ota_upgrade.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota/ota_backend.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota/ota_backend_sdcard.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota/ota_backend_bt.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota/ota_backend_uart.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/src/ota/ota_app.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display/ui_manager.h \
    $(wildcard include/config/seg/led/manager.h) \
    $(wildcard include/config/led/manager.h) \
    $(wildcard include/config/gui.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display/seg_led_manager.h \
    $(wildcard include/config/seg/led/display.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdio.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/display/seg_led_display.h \
    $(wildcard include/config/led/number/icons.h) \
    $(wildcard include/config/led/number/items.h) \
    $(wildcard include/config/led/com/num.h) \
    $(wildcard include/config/led/use/default/map.h) \
    $(wildcard include/config/led/use/1p2inch/map.h) \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display/ugui.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/display/led_display.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/pwm.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/flash.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/property_manager.h \
  /mnt/hgfs/vmshare/ATS2853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/dvfs.h \

src/ota/ota_app_foreground.o: $(deps_src/ota/ota_app_foreground.o)

$(deps_src/ota/ota_app_foreground.o):
