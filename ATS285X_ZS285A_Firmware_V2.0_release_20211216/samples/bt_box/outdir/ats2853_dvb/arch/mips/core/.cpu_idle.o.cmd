cmd_arch/mips/core/cpu_idle.o := /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-gcc -Wp,-MMD,arch/mips/core/.cpu_idle.o.d  -nostdinc -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include-fixed -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated -include /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated/autoconf.h  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/lib/crypto/tinycrypt/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/audio -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/media -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/misc -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/network -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/wechat -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips" -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips"/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -DKERNEL -D__ZEPHYR__=1 -c -g -xassembler-with-cpp -D_ASMLANGUAGE -Os -G0 -EL -gdwarf-2 -gstrict-dwarf -msoft-float -fno-common -mips32r2   -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/drivers   -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/drivers   -c -o arch/mips/core/cpu_idle.o /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/core/cpu_idle.S

source_arch/mips/core/cpu_idle.o := /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/core/cpu_idle.S

deps_arch/mips/core/cpu_idle.o := \
    $(wildcard include/config/tickless/idle.h) \
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
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/csky.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/toolchain/common.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/sections.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/section_tags.h \
    $(wildcard include/config/xip.h) \
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
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include/mips32_regs.h \

arch/mips/core/cpu_idle.o: $(deps_arch/mips/core/cpu_idle.o)

$(deps_arch/mips/core/cpu_idle.o):
