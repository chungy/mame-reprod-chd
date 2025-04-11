-- this currently crashes during install, needs more work
software = "os2warp3"
chd = "import_dev_hdd_1G"

t_software = {
  { 10, 5, "import_at486", "Import machine" },
  { 10, 10, "attach_flop1_flop1", "Insert Installation Disk" },
  { 2000, 10, "attach_cdrom1_cdrom1", "Insert CDROM ATAPI" },
  { 1500, 10, "attach_flop1_flop2", "Insert Diskette 1" },
  { 10, 10, "KEY_ENTER", "" },
--  { 6500, 10, "KEY_E", "Easy Installation" },
  { 6500, 10, "KEY_A", "Advanced Installation" },
  { 30, 10, "KEY_A", "" },
  -- Enter Select Partition
  -- Enter Open Menu
  -- B Install Boot Manager
  -- DOWN Select Unformatted Spaces
  -- Enter Open Menu
  -- C Create Partition
  -- Enter Partition Size
  -- P Create Primary Partition
  -- 
--  { 20, 10, "KEY_A", "" },
--  { 80, 10, "KEY_F", "" },
--  { 20, 5, "KEY_ENTER", "" },
  { 50, 5, "eject_flop1", "Empty Floppy Disk Drive 1" },
  { 10, 5, "eject_flop2", "Empty Floppy Disk Drive 2" },
  { 20, 10, "soft_reset", "" },
  { 10, 10, "throttle", "Throttle" },
--  { 20, 10, "attach_flop1_flop1", "Insert Installation Disk" },
--  { 150, 10, "throttle", "Throttle" },
--  { 3500, 10, "attach_flop1_flop2", "Insert Diskette 1" },
--  { 10, 10, "KEY_ENTER", "" },
--  { 5200, 5, "eject_flop1", "Empty Floppy Disk Drive 1" },
--  { 10, 5, "eject_flop2", "Empty Floppy Disk Drive 2" },
--  { 10, 5, "eject_cdrom1", "Empty Floppy Disk Drive" },
--  { 10, 10, "KEY_ENTER", "Installer finised" },
--  { 3000, 10, "throttle", "Throttle" },
--  { 10, 10, "stop", "Exit" },
}