cmd_misc/printk.o := /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-gcc -Wp,-MMD,misc/.printk.o.d  -nostdinc -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include -isystem /opt/mips-mti-elf/2019.09-01/bin/../lib/gcc/mips-mti-elf/7.4.0/include-fixed -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/kernel/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/arch/mips/soc/actions/woodpecker -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/boards/mips/ats2853_dvb  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated -include /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/samples/bt_box/outdir/ats2853_dvb/include/generated/autoconf.h  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/lib/crypto/tinycrypt/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/audio -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/display -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/media -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/misc -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/network -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/ota -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/wechat -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/porting/include/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips" -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/library/"mips"/al -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/ext/actions/include/bluetooth -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/utils/include/stream -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/memory/include  -I/mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/misc -Imisc -DKERNEL -D__ZEPHYR__=1 -c -g -std=c99 -Wall -Wformat -Wformat-security -D_FORTIFY_SOURCE=2 -Wno-format-zero-length -Wno-main -ffreestanding -Werror -Os -fdiagnostics-color -fno-asynchronous-unwind-tables -fno-pic -fno-stack-protector -ffunction-sections -fdata-sections -Os -G0 -EL -gdwarf-2 -gstrict-dwarf -msoft-float -fno-common -minterlink-mips16 -mframe-header-opt -mips32r2 -mips16 -Wno-unused-but-set-variable -fno-reorder-functions -fno-defer-pop -Wno-pointer-sign -fno-strict-overflow -Werror=implicit-int    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(printk)"  -D"KBUILD_MODNAME=KBUILD_STR(printk)" -c -o misc/printk.o /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/misc/printk.c

source_misc/printk.o := /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/misc/printk.c

deps_misc/printk.o := \
    $(wildcard include/config/actions/trace.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/misc/printk.h \
    $(wildcard include/config/assert.h) \
    $(wildcard include/config/assert/show/file/func.h) \
    $(wildcard include/config/assert/show/file.h) \
    $(wildcard include/config/assert/show/func.h) \
    $(wildcard include/config/printk.h) \
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
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/inttypes.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/lib/libc/minimal/include/stdint.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/sections.h \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/linker/section_tags.h \
    $(wildcard include/config/xip.h) \
  /mnt/hgfs/actions/ATS1853/ATS285X_ZS285A_Firmware_V2.0_release_20211216/include/mpu_acts.h \
    $(wildcard include/config/mpu/stack/guard.h) \

misc/printk.o: $(deps_misc/printk.o)

$(deps_misc/printk.o):
