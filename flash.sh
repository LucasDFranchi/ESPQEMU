esptool.py --chip esp32 merge_bin --output result.bin --fill-flash-size 4MB \
  0x1000 .pio/build/esp32dev/bootloader.bin \
  0x8000 .pio/build/esp32dev/partitions.bin \
  0x10000 .pio/build/esp32dev/firmware.bin \
  --flash_mode dio --flash_freq 40m --flash_size 4MB

qemu-system-xtensa -nographic -machine esp32 -drive file=result.bin,if=mtd,format=raw -no-reboot -serial file:output.log

