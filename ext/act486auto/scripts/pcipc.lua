start = 200
keymap = "pcipc_kbd"

tags = {
  screen1 = ":pci:4:virge:screen",
  flop1 = ":board4:fdc37c93x:fdc:0:35hd",
  flop2 = ":board4:fdc37c93x:fdc:1:35hd",
  hard1 = ":pci:07.1:ide1:0:hdd:image",
  cdrom1 = ":pci:07.1:ide2:0:cdrom:image",
}

-- The date is hard-coded for FreeDOS 1.4's release date.
--

t_step = {
   -- Enter BIOS
   { 50, 10, "KEY_F2", "Enter BIOS" },
   { 550, 1, "KEY_0", "Setting date and time" }, -- Hour
   { 4, 2, "KEY_6", "" },
   { 4, 2, "KEY_TAB", "" },
   { 4, 2, "KEY_0", "" }, -- Minute
   { 4, 2, "KEY_0", "" },
   { 4, 2, "KEY_TAB", "" },
   { 4, 2, "KEY_0", "" }, -- Second
   { 4, 2, "KEY_0", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_0", "" }, -- Month
   { 4, 2, "KEY_4", "" },
   { 4, 2, "KEY_TAB", "" },
   { 4, 2, "KEY_0", "" }, -- Day
   { 4, 2, "KEY_5", "" },
   { 4, 2, "KEY_TAB", "" },
   { 4, 2, "KEY_2", "" }, -- Year
   { 4, 2, "KEY_0", "" },
   { 4, 2, "KEY_2", "" },
   { 4, 2, "KEY_5", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_ENTER", "Setting up second floppy" },
   { 4, 2, "KEY_UP", "" },
   { 4, 2, "KEY_UP", "" },
   { 4, 2, "KEY_ENTER", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_DOWN", "" },
   { 4, 2, "KEY_ENTER", "Setting secondary master to auto" },
   { 4, 2, "KEY_MINUS", "" },
   { 4, 2, "KEY_ESC", "" },
   { 4, 2, "KEY_LEFT", "" },
   { 4, 2, "KEY_ENTER", "Exit and save changes" },
   { 4, 2, "KEY_ENTER", "" },
}
