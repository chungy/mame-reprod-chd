# FreeDOS 1.4 image

This is a pre-made hard disk image for FreeDOS 1.4.  `freedos14.inp`
was recorded with MAME 0.276.

In order to recreate the disk, you must have the upstream FreeDOS
installation files, at the very least `fd14live.chd` and
`FD14BOOT.img`.  Both these files are downloadable from upstream’s
[FD14-LiveCD.zip](https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.4/)
archive.

To recreate `freedos14.chd`:

 1. Have the CD-ROM and floppy images mentioned above in a configured
    ROM path for MAME.
 2. Create an empty CHD: `chdman createhd -o freedos14.chd --chs 1015,16,63`
 3. Run MAME’s pcipc driver with these parameters: `mame pcipc -nonvram_save -nvram_directory /dev/null -harddisk1 ./freedos14.chd -cdrom1 freedos14 -floppydisk1 freedos14:flop1 -playback freedos14.inp -nothrottle -exit_after_playback`
