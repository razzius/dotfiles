local fastKeyStroke = function(modifiers, character)
  local event = hs.eventtap.event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

alert = hs.alert.show

send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(0.18, control_key_handler)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["cmd"] == new_mods["cmd"] then
    return false
  end
  if not last_mods["cmd"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    last_mods = new_mods
    control_key_timer:stop()
    if send_escape then
      return true, {
        hs.eventtap.event.newKeyEvent({}, 'escape', true),
        hs.eventtap.event.newKeyEvent({}, 'escape', false),
      }
    end
  end
  return false
end

control_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, control_handler)
control_tap:start()

other_handler = function(evt)
  send_escape = false
  return false
end

other_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, other_handler)
other_tap:start()

slackBinding = hs.hotkey.new({"cmd"}, "`", function()
  fastKeyStroke({"alt", "shift"}, "Down")
end)

hs.hotkey.bind({"ctrl"}, "W", function()
  fastKeyStroke({"alt"}, "delete")
end)
  
hs.hotkey.bind({"ctrl"}, "J", function()
  fastKeyStroke({}, "return")
end)

hs.hotkey.bind({"cmd"}, "escape", function()
  hs.alert.show("reloat")
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

slackFilter = hs.window.filter.new('Slack')
slackFilter:subscribe(hs.window.filter.windowFocused, function() slackBinding:enable() end)
slackFilter:subscribe(hs.window.filter.windowUnfocused, function() slackBinding:disable() end)
