cmd_subsys/built-in.o :=  /opt/mips-mti-elf/2019.09-01/bin/mips-mti-elf-ld -nostartfiles -nodefaultlibs -nostdlib -static -EL   -r -o subsys/built-in.o subsys/usb/built-in.o subsys/bluetooth/built-in.o subsys/net/built-in.o subsys/shell/built-in.o subsys/logging/built-in.o subsys/debug/built-in.o subsys/tracing/built-in.o subsys/partition/built-in.o subsys/fw_version/built-in.o 
