software = "freedos13rc4_144"
chd = "import_dev_hdd_500M"

  -- offset, release delay, portmap, comment
t_software = {
    -- FREEDOS RC4
    { 10, 5, "import_at486", "Import machine" },
    { 100, 10, "attach_flop1_flop1", "" },
    { 5800, 5,  "KEY_Y", "" },
    { 14500, 5,  "KEY_Y", "" },
    { 15500, 5, "eject_flop1", "" },
    { 3000, 10, "throttle", "" },
}