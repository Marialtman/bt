cmd_src/fm/built-in.o :=  /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-ld -nostartfiles -nodefaultlibs -nostdlib -static -EL   -r -o src/fm/built-in.o src/fm/fm_main.o src/fm/fm_event.o src/fm/fm_view.o src/fm/fm_media.o src/fm/fm_func.o src/fm/fm_app_shell.o 