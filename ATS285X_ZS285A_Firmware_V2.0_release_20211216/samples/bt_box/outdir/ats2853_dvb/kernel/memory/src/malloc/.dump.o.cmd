cmd_kernel/memory/src/malloc/dump.o := /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-gcc -Wp,-MMD,kernel/memory/src/malloc/.dump.o.d  -nostdinc -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include-fixed -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated -include /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated/autoconf.h  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/lib/crypto/tinycrypt/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/audio -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/media -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/misc -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/network -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/wechat -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips" -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips"/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/memory/include  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel -Ikernel -DKERNEL -D__ZEPHYR__=1 -c -g -std=c99 -Wall -Wformat -Wformat-security -D_FORTIFY_SOURCE=2 -Wno-format-zero-length -Wno-main -ffreestanding -Werror -Os -fdiagnostics-color -fno-asynchronous-unwind-tables -fno-pic -fno-stack-protector -ffunction-sections -fdata-sections -Os -G0 -EL -gdwarf-2 -gstrict-dwarf -msoft-float -fno-common -minterlink-mips16 -mframe-header-opt -mips32r2 -mips16 -Wno-unused-but-set-variable -fno-reorder-functions -fno-defer-pop -Wno-pointer-sign -fno-strict-overflow -Werror=implicit-int   -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(dump)"  -D"KBUILD_MODNAME=KBUILD_STR(dump)" -c -o kernel/memory/src/malloc/dump.o /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/memory/src/malloc/dump.c

source_kernel/memory/src/malloc/dump.o := /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/memory/src/malloc/dump.c

deps_kernel/memory/src/malloc/dump.o := \
    $(wildcard include/config/memory/analysis.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/init.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/device.h \
    $(wildcard include/config/kernel/init/priority/default.h) \
    $(wildcard include/config/device/power/management.h) \
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
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include/kernel_structs.h \
    $(wildcard include/config/stack/sentinel.h) \
    $(wildcard include/config/sys/power/management.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/string.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/bits/restrict.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include/kernel_arch_data.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include/nano_internal.h \
    $(wildcard include/config/timeslicing.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include/kernel_arch_func.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/stack_backtrace.h \
    $(wildcard include/config/stack/backtrace.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/memory/include/buddy_inner.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/memory/include/page_inner.h \
    $(wildcard include/config/pool/page/shift.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/mem_buddy.h \

kernel/memory/src/malloc/dump.o: $(deps_kernel/memory/src/malloc/dump.o)

$(deps_kernel/memory/src/malloc/dump.o):
