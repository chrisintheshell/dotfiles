-- General

hs.logger.defaultLogLevel = "info"

alt_hyper = { "cmd", "ctrl" }
hyper = { "cmd", "alt", "ctrl" }
shift_hyper = { "cmd", "alt", "ctrl", "shift" }

-- Maps Left Ctrl + HJKL to arrow keys while preserving Shift, ⌘, and ⌥
local keyMap = {
  h = "left",
  j = "down",
  k = "up",
  l = "right"
}

eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  local originalKey = hs.keycodes.map[event:getKeyCode()]
  local mods = event:getFlags()

  -- Only trigger remapping when Left Ctrl is held
  if mods.ctrl and keyMap[originalKey] then
    -- Create a table of currently active modifiers, excluding Ctrl
    local newMods = {}
    if mods.shift then table.insert(newMods, "shift") end
    if mods.cmd then table.insert(newMods, "cmd") end
    if mods.alt then table.insert(newMods, "alt") end

    -- Simulate the key press with the modified keys (excluding Ctrl)
    hs.eventtap.keyStroke(newMods, keyMap[originalKey], 0)
    return true -- Suppress the original key press
  end

  return false -- Allow other key events to pass through
end)

eventtap:start()

-- Spoon Management

hs.loadSpoon("SpoonInstall")

-- Application hotkeys
hs.hotkey.bind(alt_hyper, "1", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(alt_hyper, "2", function()
  hs.application.launchOrFocus("Mail")
end)

hs.hotkey.bind(alt_hyper, "3", function()
  hs.application.launchOrFocus("Mimestream")
end)

hs.hotkey.bind(alt_hyper, "4", function()
  hs.application.launchOrFocus("Bear")
end)

hs.hotkey.bind(alt_hyper, "5", function()
  hs.application.launchOrFocus("NetBox Work")
end)

hs.hotkey.bind(alt_hyper, "6", function()
  hs.application.launchOrFocus("Jira")
end)

hs.hotkey.bind(alt_hyper, "7", function()
  hs.application.launchOrFocus("Confluence")
end)

hs.hotkey.bind(alt_hyper, "C", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(alt_hyper, "E", function()
  hs.application.launchOrFocus("Zed")
end)

hs.hotkey.bind(alt_hyper, "W", function()
  hs.application.launchOrFocus("Fantastical")
end)

-- Define the keyboard shortcut
hs.hotkey.bind(alt_hyper, "M", function()
  -- The AppleScript you want to run
  local get_message_url = [[
    tell application "Mail"
	set selMessages to selection
	if (count selMessages) > 0 then
		set thisMsg to item 1 of selMessages
		set thisMsgURL to "message://%3c" & (message id of thisMsg) & "%3e"
		tell me to set the clipboard to thisMsgURL
		display notification "Message from " & sender of thisMsg & ", subject: " & subject of thisMsg with title "Message Copied"
	else
		display notification "Nothing selected."
	end if
    end tell
    ]]

  -- Execute the AppleScript
  hs.osascript.applescript(get_message_url)
end)

local localfile = hs.configdir .. "/init-local.lua"
if hs.fs.attributes(localfile) then
  dofile(localfile)
end
