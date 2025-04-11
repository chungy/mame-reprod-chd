# act486auto

offset (frame) based automation for MAME machines, it is all pretty rough and was built initially for use with at486 and ct486 machines and msdos622 as a demo, so CHS is hardcoded to a 1G size.

# setup
in `scripts/`
* machine  -> create a `machine.lua` with a `t_machine` table
* software -> create a `software.lua` with a `t_software` table

set any vars your machine or software needs in the respective files with desired scope

the `t_` tables row format is `{ offset, delay, portmap, "comment" },`

offsets are offset from 0 based on a start delay per machine, `900` for at486 it is not true frames as we only start after machine time starts

## commands
* see `portmap.lua` for available key commands
* `stop` and `throttle` are special keywords
* `fd0_softlist_dev` will insert `flop(n)` into floppy drive 1
* `cd0_softlist_dev` will insert `cdrom` into cdrom drive 1
* `import_<file base name>` will preprocess steps from `t_step` table

## usage
with a blank chd image of CHS `2048,16,63` (1G) install msdos622
`mame -w at486 -nvram_directory /dev/null msdos622 -hard1 msdos622.chd -skip_gameinfo -ramsize 64M -plugins -plugin act486auto`

with cdrom device
`./mame -w at486 -nvram_directory /dev/null os2warp3 -hard1 test.chd -skip_gameinfo -ramsize 64M -board3:ide:ide:1 cdrom -cdrom os2warp3 -plugins -plugin act486auto`


expect output on the cli based on your machine and software configurations
```
11627	14400	14410	Insert Floppy Disk 2
11627	14500	14510	
11627	24500	24510	Insert Floppy Disk 3
11627	24600	24610	
11627	33600	33610	
11627	33700	33710	
11627	34200	34205	Empty Floppy Disk Drive
11627	37200	37210	Throttle
11627	37210	37220	Exit
```

```
col1 current frame
col2 offset start
col3 offset end (offset + delay)
col4 comment
```


perhaps we should use machine time and natkeyboard, perhaps seconds is enough, perhaps more commands and devices should be supported, perhaps later we will

sai
