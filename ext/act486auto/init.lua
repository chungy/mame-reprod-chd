-- license:BSD-3-Clause
-- copyright-holders:sairuk


-- maybe should have used natkeyboard but i was in too deep

local exports = {
	name = 'act486auto',
	version = '0.0.1',
	description = 'act486 auto config demo',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local act486auto = exports
local reset_subscription
local frame_subscription
local frame = 0
local lframe = 0
local fstart = 0
local fend = 0
local offset = 0
local keys = {}
local lcomment = "None"
local ltfield = 0

-- allowed to be overriden in software.lua
hud = true

local function split(s, sep)
  local t = {}
  if sep == nil then sep = "," end
  for str in string.gmatch(s, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

-- https://www.reddit.com/r/MAME/comments/1aw9h7c/comment/ksow3uj/
local function press(tfield)
  for key, value in pairs(split(tfield))
  do
    port = portmap[value][1]
    field = portmap[value][2]
    manager.machine.ioport.ports[port].fields[field]:set_value(1)
  end
end

local function release(tfield)
  for key, value in pairs(split(tfield))
  do
    port = portmap[value][1]
    field = portmap[value][2]
    manager.machine.ioport.ports[port].fields[field]:clear_value()
  end
end

local function attach_image(tag, software)
  manager.machine.images[tag]:load_software(software)
end

local function detach_image(tag)
  manager.machine.images[tag]:unload()
end

local function nothrottle()
  manager.machine.video.throttled = false
	manager.machine.video.frameskip = 10
end

local function throttle()
  manager.machine.video.throttled = true
	manager.machine.video.frameskip = 0
end

local function soft_reset()
  manager.machine:soft_reset()
end

local function hard_reset()
  manager.machine:hard_reset()
end

local function pause()
  emu.pause()
end

local function unpause()
  emu.unpause()
end

local function cassette(action)

  m = manager.machine
  for i,v in pairs(m.cassettes) do
    d = i
    break
  end

  if d == nil then
    emu.print_error("Could not determine cassette device, manual intervention required")
    throttle()
  end

  t = m.cassettes[d]
  
  if action == "play" then
   	if not t.is_playing then t:play() end
  end

end

local function exit()
  manager.machine:exit()
end

local function draw_hud()
  if hud then
    frame_str = string.format("Software: %s\nFrame: %08d\nLast:\n Passed: %08d\n Action: %s\n Comment:%s", software, frame, offset, ltfield, lcomment)
    -- print(frame_str)
    manager.machine.render.ui_container:draw_text('left', 0, frame_str, 0xffffffff, 0x00000000)
  end
end

function act486auto.startplugin()

  local t
  local rport = false

  reset_subscription = emu.add_machine_reset_notifier(function()

    if emu.romname() ~= '___empty' then
      if emu.softname() ~= '___empty' then

        t = {}

        -- hackeryd00
        local softscript = exports.name .. '/scripts/software/' .. emu.romname() .. '/' .. emu.softname()
        local softfile = manager.machine.options.entries.pluginspath:value():match("([^;]+)") .. "/" .. softscript .. ".lua"
        -- local softtest = io.open(os.getenv("HOME") .. "/.mame/" .. softfile, "r")

        -- try plugin path directly, if not
        local softtest = io.open(softfile, "r")
        if not softtest then
          -- try to append to homepath
          local homepath = manager.machine.options.entries.homepath:value():match("([^;]+)") .. "/"
          softtest = io.open(homepath .. softfile, "r")
        end

        -- software script
        if softtest then
          io.close(softtest)
          require(softscript)
          for sk, sv in pairs(t_software) do
            table.insert(t, sv)
          end
        else
          print("failed to load " .. homepath .. softfile)
          exit()
        end

        -- preprocess imports
        for itk, itv in pairs(t) do
          itfield = itv[3]
          if string.match(itfield, "import_") then
            import = string.gsub(itfield, "import_(.+)", "%1")
            require(exports.name .. "/scripts/" .. import)
            table.remove(t, itk)
            for tdk, tdv in pairs(t_step) do
              idx = itk + (tdk - 1)
              table.insert(t, idx, tdv)
            end
          end
        end
        require(exports.name .. '/portmap/' .. keymap )
        nothrottle()
      end
    end
  end)

  -- for i,v in pairs(manager.machine.images) do print(i) end
  frame_subscription = emu.add_machine_frame_notifier(function()
    if manager.machine.time.seconds > 0 then
      fstart = start
      --draw_hud(frame)
      for tk, tv in pairs(t) do
        tfield = tv[3]
        comment = tv[4]

        fstart = fstart + tv[1]
        fend = fstart + tv[2]
        
        if frame == fstart then
          -- attach images
          if string.match(tfield, "eject_") then
            softdev = string.gsub(tfield, "eject_(.+)", "%1")
            detach_image(tags[softdev])
          elseif string.match(tfield, "attach_") then 
            softdev = string.gsub(tfield, "attach_(.+)_(.+)", "%1")
            softimg = string.gsub(tfield, "attach_(.+)_(.+)", "%2")
            attach_image(tags[softdev], software .. ":" .. softimg)
          elseif string.match(tfield, "cass_") then
            action = string.gsub(tfield, "cass_(.+)", "%1")
            cassette(action)
          elseif string.match(tfield, "throttle") then
            throttle()
          elseif string.match(tfield, "soft_reset") then
            soft_reset()
          elseif string.match(tfield, "hard_reset") then
            hard_reset()
          elseif string.match(tfield, "pause") then
            pause()
          elseif string.match(tfield, "stop") then
            exit()
          else
            print(string.format("%s\t%s\t%s", frame, tfield, comment))
            -- press key, multiple if required
            if string.match(tfield,",") then
              for key in string.gmatch(tfield, "([^,]+)") do
                table.insert(keys, key)
              end
            else
              table.insert(keys, tfield)
            end

            if rport == false then
              for i, key in pairs(keys) do
                press(key)
              end
              rport = true
            end
          end 
        end

        -- release pressed keys
        if rport and frame == fend then
          for i, key in pairs(keys) do
            release(key)
          end
          keys = {}
          rport = false
          if comment == "" then
            lcomment = "None"
          else
            lcomment = comment
          end
          ltfield = tfield
          lframe = frame
        end
      end
      frame = frame + 1
      offset = frame - lframe
    end
  end)

  emu.register_frame_done(draw_hud)

end

return exports
