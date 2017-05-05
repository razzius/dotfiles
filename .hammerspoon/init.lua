fastKeyStroke = function(modifiers, character)
  local event = hs.eventtap.event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

alert = hs.alert.show

len = function(t)
    local length = 0
    for k, v in pairs(t) do
      length = length + 1
    end
    return length
end


send_escape = false
prev_modifiers = {}

modifier_handler = function(evt)
  -- evt:getFlags() holds the modifiers that are currently held down
  local curr_modifiers = evt:getFlags()

  if curr_modifiers["cmd"] and len(curr_modifiers) == 1 and len(prev_modifiers) == 0 then
    -- We need this here because we might have had additional modifiers, which
    -- we don't want to lead to an escape, e.g. [Ctrl + Cmd] —> [Cmd] —> [ ]
    send_escape = true
  elseif prev_modifiers["cmd"] and len(curr_modifiers) == 0 and send_escape then
    send_escape = false
    fastKeyStroke({}, "ESCAPE")
  else
    send_escape = false
  end
    prev_modifiers = curr_modifiers
  return false
end


-- Call the modifier_handler function anytime a modifier key is pressed or released
modifier_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, modifier_handler)
modifier_tap:start()


-- If any non-modifier key is pressed, we know we won't be sending an escape
non_modifier_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
    send_escape = false
  return false
end)
non_modifier_tap:start()

slackBinding = hs.hotkey.new({"cmd"}, "`", function()
  fastKeyStroke({"alt", "shift"}, "Down")
end)

optionDeleteBinding = hs.hotkey.new({"ctrl"}, "W", function()
  fastKeyStroke({"alt"}, "delete")
end)

rightBeforeDown = hs.hotkey.new({"ctrl"}, "J", function()
    fastKeyStroke({}, "right")
    fastKeyStroke({}, "return")
end)

hs.hotkey.bind({"ctrl"}, "V", function()
    fastKeyStroke({"alt"}, "right")
end)

-- c-s-. is a no-op. Need some clever workaround
-- hs.hotkey.bind({"ctrl"}, ".", function()
--     fastKeyStroke({"shift"}, ".")
-- end)

hs.hotkey.bind({"ctrl"}, "Q", function()
    fastKeyStroke({"alt"}, "left")
end)

hs.hotkey.bind({"ctrl"}, "J", function()
  -- hs.eventtap.keyStroke({}, "return")
  -- TODO fast keys send c-<ret> which goes to the webpage specified in Chrome directly
  fastKeyStroke({}, "return")
end)

hs.hotkey.bind({"ctrl"}, "S", function()
  fastKeyStroke({}, "right")
  fastKeyStroke({}, "down")
  fastKeyStroke({}, "return")
end)

function reloadConfig(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end


configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/.hammerspoon/", reloadConfig):start()

-- TODO make slack open if alt tabbing to it
slackFilter = hs.window.filter.new('Slack')
slackFilter:subscribe(hs.window.filter.windowFocused, function() slackBinding:enable() end)
slackFilter:subscribe(hs.window.filter.windowUnfocused, function() slackBinding:disable() end)

terminalFilter = hs.window.filter.new('ITerm2')
terminalFilter:subscribe(hs.window.filter.windowUnfocused, function() optionDeleteBinding:enable() end)
terminalFilter:subscribe(hs.window.filter.windowFocused, function() optionDeleteBinding:disable() end)

chromeFilter = hs.window.filter.new('Google Chrome')
chromeFilter:subscribe(hs.window.filter.windowFocused, function() rightBeforeDown:enable() end)
chromeFilter:subscribe(hs.window.filter.windowUnfocused, function() rightBeforeDown:disable() end)

hs.hotkey.bind({"ctrl", "alt", "shift"}, "S", function()
  fastKeyStroke({}, '1')
end)

alert('Config loaded')
