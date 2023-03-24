cmd_drivers/display/act_led_display.o := /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-gcc -Wp,-MMD,drivers/display/.act_led_display.o.d  -nostdinc -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include-fixed -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated -include /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated/autoconf.h  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/lib/crypto/tinycrypt/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/audio -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/media -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/misc -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/network -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/wechat -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips" -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips"/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/drivers/display -Idrivers/display -DKERNEL -D__ZEPHYR__=1 -c -g -std=c99 -Wall -Wformat -Wformat-security -D_FORTIFY_SOURCE=2 -Wno-format-zero-length -Wno-main -ffreestanding -Werror -Os -fdiagnostics-color -fno-asynchronous-unwind-tables -fno-pic -fno-stack-protector -ffunction-sections -fdata-sections -Os -G0 -EL -gdwarf-2 -gstrict-dwarf -msoft-float -fno-common -minterlink-mips16 -mframe-header-opt -mips32r2 -mips16 -Wno-unused-but-set-variable -fno-reorder-functions -fno-defer-pop -Wno-pointer-sign -fno-strict-overflow -Werror=implicit-int   -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/drivers    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(act_led_display)"  -D"KBUILD_MODNAME=KBUILD_STR(act_led_display)" -c -o drivers/display/act_led_display.o /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/drivers/display/act_led_display.c

source_drivers/display/act_led_display.o := /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/drivers/display/act_led_display.c

deps_drivers/display/act_led_display.o := \
    $(wildcard include/config/pwm.h) \
    $(wildcard include/config/pwm/acts/dev/name.h) \
    $(wildcard include/config/gpio/acts/dev/name.h) \
    $(wildcard include/config/kernel/init/priority/device.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/zephyr.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/kernel.h \
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
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/zephyr/types.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdint.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/limits.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain/gcc.h \
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
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain/common.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/sections.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/section_tags.h \
    $(wildcard include/config/xip.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/atomic.h \
    $(wildcard include/config/atomic/operations/builtin.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/errno.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/__assert.h \
    $(wildcard include/config/assert.h) \
    $(wildcard include/config/assert/level.h) \
    $(wildcard include/config/actions/trace.h) \
    $(wildcard include/config/assert/show/file/func.h) \
    $(wildcard include/config/assert/show/file.h) \
    $(wildcard include/config/assert/show/func.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/printk.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/inttypes.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/dlist.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/slist.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdbool.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/util.h \
    $(wildcard include/config/myfeature.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/kernel_version.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/drivers/rand32.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include/kernel_arch_thread.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sys_clock.h \
    $(wildcard include/config/sys/clock/hw/cycles/per/sec.h) \
    $(wildcard include/config/tickless/kernel/time/unit/in/micro/secs.h) \
    $(wildcard include/config/sys/clock/ticks/per/sec.h) \
    $(wildcard include/config/timer/reads/its/frequency/at/runtime.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/cpu.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/arch.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/exc.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/error.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/irq.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/irq.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sw_isr_table.h \
    $(wildcard include/config/irq/stat.h) \
    $(wildcard include/config/num/irqs.h) \
    $(wildcard include/config/gen/irq/start/vector.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/asm_inline.h \
    $(wildcard include/config/use/mips16e.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/arch/mips/sys_io.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/sys_io.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/init.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/device.h \
    $(wildcard include/config/kernel/init/priority/default.h) \
    $(wildcard include/config/device/power/management.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb/board.h \
    $(wildcard include/config/audio/in/i2srx0/support.h) \
    $(wildcard include/config/i2s/5wire.h) \
    $(wildcard include/config/i2s/pseudo/5wire.h) \
    $(wildcard include/config/input/dev/acts/irkey.h) \
    $(wildcard include/config/panel/st7789v.h) \
    $(wildcard include/config/outside/flash.h) \
    $(wildcard include/config/panel/ssd1306.h) \
    $(wildcard include/config/encoder/input.h) \
    $(wildcard include/config/input/dev/acts/adc/sr.h) \
    $(wildcard include/config/acts/timer3/capture.h) \
    $(wildcard include/config/soc/series/woodpeckerfpga.h) \
    $(wildcard include/config/audio/out/spdiftx/support.h) \
    $(wildcard include/config/audio/in/spdifrx/support.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/ext_types.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_regs.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_clock.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_reset.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_irq.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_gpio.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_pinmux.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_pm.h \
    $(wildcard include/config/pm/sleep/time/trace.h) \
    $(wildcard include/config/pm/cpu/idle/low/power.h) \
    $(wildcard include/config/auto/standby/s2/lowfreq.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_adc.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_dma.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_cmu.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_memctrl.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_pmu.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_cache.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_asrc.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_ui.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_timer.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_dsp.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_uart.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_spi.h \
    $(wildcard include/config/hosc/clk/mhz.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_atp.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_debug.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_freq.h \
    $(wildcard include/config/soc/spread/spectrum.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_boot.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_se.h \
    $(wildcard include/config/crc32/mode.h) \
    $(wildcard include/config/crc16/mode.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/dma.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/soc_watchdog.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker/brom_interface.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/gpio.h \
    $(wildcard include/config/idx.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/string.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/bits/restrict.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/logging/sys_log.h \
    $(wildcard include/config/sys/log/default/level.h) \
    $(wildcard include/config/sys/log/override/level.h) \
    $(wildcard include/config/sys/log.h) \
    $(wildcard include/config/sys/log/ext/hook.h) \
    $(wildcard include/config/sys/log/show/color.h) \
    $(wildcard include/config/sys/log/show/tags.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include/mem_manager.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/display/led_display.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdio.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/pwm.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/display.h \

drivers/display/act_led_display.o: $(deps_drivers/display/act_led_display.o)

$(deps_drivers/display/act_led_display.o):
