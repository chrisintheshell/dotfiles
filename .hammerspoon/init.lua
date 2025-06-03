-- General

hs.logger.defaultLogLevel = "info"

alt_hyper = { "cmd", "ctrl" }
hyper = { "cmd", "alt", "ctrl" }
shift_hyper = { "cmd", "alt", "ctrl", "shift" }

-- Spoon Management

hs.loadSpoon("SpoonInstall")

-- Constants

local appGhostty = "Ghostty"
-- Maps Left Ctrl + HJKL to arrow keys while preserving Shift, ⌘, and ⌥
local keyMap = {
  h = "left",
  j = "down",
  k = "up",
  l = "right"
}
local previousSpace = nil
local previousApp = nil

-- Tap into input events (mouse, keyboard, trackpad)

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

-- Keybindings

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
  hs.application.launchOrFocus("Things3")
end)

hs.hotkey.bind(alt_hyper, "6", function()
  hs.application.launchOrFocus("NetBox Work")
end)

hs.hotkey.bind(alt_hyper, "7", function()
  hs.application.launchOrFocus("Jira")
end)

hs.hotkey.bind(alt_hyper, "8", function()
  hs.application.launchOrFocus("Confluence")
end)

hs.hotkey.bind(alt_hyper, "C", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(alt_hyper, "E", function()
  hs.application.launchOrFocus("Zed")
end)

hs.hotkey.bind(alt_hyper, "G", function()
  hs.application.launchOrFocus("GoodLinks")
end)

-- Hotkey to copy message ID from an email using message:// URL scheme
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

hs.hotkey.bind(alt_hyper, "O", function()
  hs.application.launchOrFocus("1Password")
end)

hs.hotkey.bind(alt_hyper, "P", function()
  hs.application.launchOrFocus("Planner")
end)

-- Hotkey to show/hide the Ghostty terminal app window (currently using tmux with a quick terminal so this is not really used)
hs.hotkey.bind(alt_hyper, "T", function()
  local currentApp = hs.application.frontmostApplication()
  local currentSpace = hs.spaces.focusedSpace()
  local targetApp = hs.application.get(appGhostty)

  if targetApp and targetApp:isFrontmost() then
    -- If Ghostty is active, switch back
    if previousApp and previousApp:name() ~= "Finder" then
      previousApp:activate()
    elseif previousSpace then
      hs.spaces.gotoSpace(previousSpace)
    else
      hs.eventtap.keyStroke({ "ctrl" }, "Up") -- Open Mission Control as a fallback
    end
  else
    -- Store current app and space before switching
    if currentApp:name() ~= "Finder" then
      previousApp = currentApp
    end
    previousSpace = currentSpace

    if targetApp then
      -- Attempt to select the first window from the Window menu
      local menuItems = targetApp:getMenuItems()
      if menuItems and menuItems["Window"] then
        local windowMenu = menuItems["Window"]
        for _, item in ipairs(windowMenu) do
          if item.AXTitle and not item.AXRole then
            targetApp:selectMenuItem(item.AXTitle)
            break -- Select the first valid window
          end
        end
      end

      -- Ensure Ghostty's window is focused
      local win = targetApp:mainWindow()
      if win then
        win:focus()
      else
        hs.application.launchOrFocus(appGhostty)
      end
    else
      hs.application.launchOrFocus(appGhostty)
    end
  end
end)

hs.hotkey.bind(alt_hyper, "W", function()
  hs.application.launchOrFocus("Fantastical")
end)

local localfile = hs.configdir .. "/init-local.lua"
if hs.fs.attributes(localfile) then
  dofile(localfile)
end

hs.alert.show("Hammerspoon Config Loaded")
