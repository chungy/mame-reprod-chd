software = "msdos622"
chd = "import_dev_hdd_500M"

  -- offset, release delay, portmap, comment
t_software = {
  -- MSDOS 622
  { 10, 5, "import_at486", "Import machine" },
  { 10, 10, "attach_flop1_flop1", "Insert Floppy Disk 1" },
  { 2500, 10, "KEY_ENTER", "" },
  { 100, 10, "KEY_ENTER", "" },
  { 100, 10, "KEY_ENTER", "" },
  { 100, 10, "KEY_ENTER", "" },
  { 2800, 10, "KEY_ENTER", "" },
  { 100, 10, "KEY_ENTER", "" },
  { 6900, 10, "attach_flop1_flop2", "Insert Floppy Disk 2" },
  { 100, 10, "KEY_ENTER", ""  },
  { 10000, 10, "attach_flop1_flop3", "Insert Floppy Disk 3"  },
  { 100, 10, "KEY_ENTER", "" },
  { 9000, 10, "KEY_ENTER", "" },
  { 100, 10, "KEY_ENTER", "" },
  { 500, 5, "eject_flop1", "Empty Floppy Disk Drive" },

  { 3000, 10, "throttle", "Throttle" },
  { 10, 10, "stop", "Exit" },
}