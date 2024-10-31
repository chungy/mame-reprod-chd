These are pre-made hard disk images for FreeDOS, both in the
5150-optimized “minimized” variety, and a standard 527MB image for
5170+ machines.

FreeDOS doesn’t distribute hard disk images of this nature, instead
they were recreated from the installation medium.  In order to
reproduce the images (thereby proving an untampered state), the inp
recording files can be used to recreate them.  Both of them use the
floppy-disk only version of FreeDOS (for technical reasons concerning
FreeDOS’s inability to access the CD-ROM under MAME’s present
drivers), and since MAME’s input playback does not support
automatically swapping floppy disk media, some supervision is
required.

To recreate freedos13_8086.chd:
* Have the ibm5150/freedos13_8080 disk image set.  This can be done by
  grabbing the FD13-D[12].IMG files from
  https://archive.org/details/free-dos-1.3-8086-minimized and placing
  them into a folder of that name (in your rompath).
* Create an empty CHD: chdman createhd -o freedos13_8086.chd --chs 615,4,17
* Run MAME’s ibm5150 driver with these parameters:
  mame ibm5150 -floppydisk1 freedos13_8086 -harddisk1 ./freedos13_8086.chd \
       -playback freedos13_8086.inp -nothrottle -exit_after_playback
* Since this runs under “-nothrottle”, you’ll have to be quick about
  bringing up the file manager window (Scroll Lock, TAB, File, floppy,
  switch to flop1) when setup.bat prompts to do so.  I give about 15
  minutes of ibm5150 “real time” to do it; it should be just enough
  for a fast finger to achieve it even in nothrottle mode.  Press F10
  to turn the machine back to normal speed if you wish to not miss it.
* Once done, freedos13_8086.chd should represent the hash in
  hash/ibm5150_hdd.xml, but you’ll have to copy it first:
  chdman copy -i freedos13_8086.chd -o freedos13_8086_compressed.chd
* This whole process takes about 7 minutes of real time, but should
  happen in under a minute in nothrottle mode.

To recreate freedos13.chd:

* Have the ibm5170/freedos13_144 disk image set.  This can be done by
  grabbing the floppy edition of FreeDOS from
  https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.3/official/FD13-FloppyEdition.zip
  and placing the 144m/* files into a ibm5170/freedos13_144 directory.
* Create an empty CHD: chdman createhd -o freedos13.chd --chs 1015,16,63
* Run MAME’s ct486 driver with these parameters:
  mame ct486 -floppydisk1 freedos13_144 -harddisk1 ./freedos13.chd \
       -playback freedos13.inp -nothrottle -exit_after_playback
* Like the other image, I try to give about 15 seconds of “real time”
  to change disk images.  This installation is *VERY SLOW* and even in
  nothrottle mode, it is tedious.  You’ll have to keep track of which
  floppy image you selected so you can select the correct next one.
  With six total disks, it’s easy to get a bit confused...
* This whole process takes about 50 minutes of real time, and what
  feels like an eternity in nothrottle mode ;)

Why so slow? FreeDOS’s install disks seem to be compressed with a
format optimized for much newer computers than the 25MHz 486 that
ct486 emulates.  With a dearth of good PC options in MAME, this is the
route I must take for a reproducible disk image.
