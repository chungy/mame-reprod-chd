# Windows NT on mmr4000le (MIPS R4000 CPU)

These are pre-made hard disk images for Windows NT 3.1, 3.51, and 4.0.
All these images were recorded with MAME 0.284 with the commit
`c80d828c` cherry-picked on top of the 0.284 release.

In order to recreate the disk, you must have the Windows NT 3.1, 3.51,
and 4.0 installation CD-ROMs, specifically the images defined in the
MAME generic_cdrom software list.  At a minimum, the following files
are needed:

 * `winnt31/en-us windows nt 3.10.528.1 1994.chd`
 * `winnt351/en-us windows nt workstation 3.51.1057.1.chd`
 * `winnt40/en-us windows nt workstation 4.0.1381.2.chd`

Images from other sources may not reflect these releases, and the
input recordings will likely desync.

## Running the installation input

In order to recreate the disks, hard disk images with the CHS geometry
set to 1040,16,63 must be created.

 1. Have the Windows NT images mentioned above available in some path.
 2. Create an empty CHD: `chdman createhd -o winnt31.chd --chs 1040,16,63`
 3. Run MAME’s mmr4000le driver with these parameters: `mame mmr4000le -nonvram_save -nvram_directory /dev/null -harddisk ./winnt31.chd -cdrom winnt31 -playback winnt31.inp -nothrottle -exit_after_playback`

Change the file names, especially for the `-cdrom` and `-playback`
parameters for the other versions as desired.

On vanilla MAME versions 0.274 through 0.284, you will need to specify
a file path to the Windows NT installation image.  Starting from
[commit
c80d828c](https://github.com/mamedev/mame/commit/c80d828cf1b122e1e6979cb8c61f25f532184163),
MAME has a generic_cdrom list and the `jazz.cpp` driver is connected
to it, making the shortname usable.

## Methodology and motivation

While MAME from versions 0.219 through 0.284 already contain hard
disks for Windows NT 3.5, 3.51, and 4.0 on the “jazz” computer
(Microsoft’s codename for their own MIPS workstations), they predate
MAME’s inclusion of the operating system installation media itself,
making the source a little unknown.  They were also installed in 2020
and the file systems reflect that with 2020 dates throughout the
system.

Preferring to have provably reproducible images, I have set out to
make new images, with the date and time set to be identical to the
files on the Windows NT installation CD-ROMs themselves, this is
assisted by recording with MAME under the `faketime` command.  Having
file dates in the 1990s looks a lot more natural for these versions
than a 2020 date.

I initially wanted to use NTFS for the operating system partition on
all the versions, but I found that only NT 3.1 accepts this
configuration for some reason, 3.51 and 4.0 insist on being FAT, even
with the ARC files existing on an independent partition.  For
consistency, all these operating systems are installed onto FAT.  Each
was given only a half-gigabyte drive, but with a dearth of software
available for Windows NT on MIPS, it should not an issue.  A secondary
hard disk can also be installed to expand the utility as needed.

Emulation was halted after the GUI installation phase.  The first boot
of the system in Event Viewer will reflect the time you start the
emulator up, rather than the installation time.  The `winmsd` program
can reflect the true installation time.

At the time of writing (January 2026), I have been unable to
successfully install Windows NT 3.5, neither with the image included
in MAME nor multiple alternative CDs, including the one with debugging
symbols not stripped out.  I do not believe this to be an issue with
the installation media, but with MAME’s emulation.  How the existing
3.5 hard disk was created, I do not know; it is possible MAME has
suffered a regression, but strange that the other versions work.

## No server versions

MAME includes installation CD-ROMs for the server editions of Windows
NT, and they can be installed on mmr4000le.  As of January 2026, the
driver does not support networking and providing server pre-installs
would wind up with an operating system effectively like the client
counterpart, only with worse foreground application performance.

If and when mmr4000le becomes capable of networking, it will be
desirable to set server configuration yourself and a pre-made disk
image may not be useful.
