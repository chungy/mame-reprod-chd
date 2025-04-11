start = 900
keymap = "ms_naturl"

tags = {
  screen1 = ":isa1:svga_et4k:screen",
  flop1 = ":board1:fdcsmc:fdc:0:35hd",
  flop2 = ":board1:fdcsmc:fdc:1:35hd",
  hard1 = ":board3:ide:ide:0:hdd:image",
  cdrom1 = ":board3:ide:ide:1:cdrom:image",
}

t_step = {
  -- offset, release delay, portmap, comment
  -- Enter Bios
  { 100, 10, "KEY_F1", "Enter Bios" },
  -- Standard CMOS Setup
  { 100, 90, "KEY_ENTER", "Standard CMOS Setup" },
  { 100, 5, "import_dev_hdd_1G", "Import HDD Type" },
  -- Floppies
  { 10, 5, "KEY_DOWN", "Configure Floppy Drives" },
  ---- Drive A
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  ---- Drive B
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  -- Exit Standard CMOS Setup
  { 10, 10, "KEY_ESC", "Exit Standard CMOS Setup" },

  -- Advanced CMOS Setup
  { 10, 5,  "KEY_DOWN", "" },
  { 20, 10, "KEY_ENTER", "Enter Advanced CMOS Setup" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  -- Boot Order
  { 10, 5,  "KEY_PGUP", "Set Boot Order" },
  -- Exit Advanced CMOS Setup
  { 10, 10, "KEY_ESC", "Exit Advanced CMOS Setup" },

  -- Save and Exit
  { 10, 5,  "KEY_F10", "Save and Exit" },
  { 10, 5,  "KEY_Y", "" },
  { 10, 10, "KEY_ENTER", "" },
}

-- board3:ide:ide:0 cdrom            ATAPI CD-ROM
--                  cf               ATA CompactFlash Card
--                  cp2024           Conner Peripherals CP-2024 hard disk
--                  cr589            Matsushita CR589 CD-ROM Drive
--                  hdd              IDE Hard Disk
--                  px320a           PleXCombo PX-320A CD-RW/DVD-ROM Drive
--                  xm3301           Toshiba XM-3301 CD-ROM Drive
--                  zip100           Iomega Zip 100MB IDE Drive
