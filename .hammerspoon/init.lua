-- General

hs.logger.defaultLogLevel = "info"

alt_hyper = { "cmd", "ctrl" }
hyper = { "cmd", "alt", "ctrl" }
shift_hyper = { "cmd", "alt", "ctrl", "shift" }

-- Spoon Management

hs.loadSpoon("SpoonInstall")

-- Constants

--local appGhostty = "Ghostty"
--local previousSpace = nil
--local previousApp = nil

-- Vi navigation with smooth scrolling
local activeScrolls = {}

-- Settings
local SCROLL_SPEED = 0.023 -- Time between scrolls (0.03 = ~33 scrolls/sec)
local HOLD_DELAY = 0.2     -- Delay before continuous scrolling starts

-- Key mappings
local keyMap = {
  h = "left",
  j = "down",
  k = "up",
  l = "right"
}

-- Send arrow key preserving modifiers (except Ctrl)
local function sendArrowKey(arrow, mods)
  local newMods = {}
  if mods.shift then table.insert(newMods, "shift") end
  if mods.cmd then table.insert(newMods, "cmd") end
  if mods.alt then table.insert(newMods, "alt") end

  hs.eventtap.keyStroke(newMods, arrow, 0)
end

-- Clean up all active scrolls
local function stopAllScrolling()
  for key, scroll in pairs(activeScrolls) do
    if scroll.timer then scroll.timer:stop() end
    activeScrolls[key] = nil
  end
end

-- Create key down handler
local keyDown = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  local key = hs.keycodes.map[event:getKeyCode()]
  local mods = event:getFlags()

  if mods.ctrl and keyMap[key] then
    -- If this key is already scrolling, ignore (blocks OS key repeat)
    if activeScrolls[key] then
      return true
    end

    local arrow = keyMap[key]
    activeScrolls[key] = { active = true }

    -- Send first arrow immediately
    sendArrowKey(arrow, mods)

    -- Schedule continuous scrolling
    activeScrolls[key].timer = hs.timer.doAfter(HOLD_DELAY, function()
      if activeScrolls[key] and activeScrolls[key].active then
        activeScrolls[key].timer = hs.timer.doEvery(SCROLL_SPEED, function()
          if activeScrolls[key] and activeScrolls[key].active then
            sendArrowKey(arrow, mods)
          end
        end)
      end
    end)

    return true
  end

  return false
end)

-- Create key up handler
local keyUp = hs.eventtap.new({ hs.eventtap.event.types.keyUp }, function(event)
  local key = hs.keycodes.map[event:getKeyCode()]

  if activeScrolls[key] then
    if activeScrolls[key].timer then
      activeScrolls[key].timer:stop()
    end
    activeScrolls[key] = nil
  end

  return false
end)

-- Watch for Ctrl release
local modifierWatcher = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  if not event:getFlags().ctrl then
    stopAllScrolling()
  end
  return false
end)

-- Start all watchers
keyDown:start()
keyUp:start()
modifierWatcher:start()

-- Cleanup on reload
if _G.viScrollCleanup then _G.viScrollCleanup() end
_G.viScrollCleanup = function()
  stopAllScrolling()
  if keyDown then keyDown:stop() end
  if keyUp then keyUp:stop() end
  if modifierWatcher then modifierWatcher:stop() end
end

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

hs.hotkey.bind(alt_hyper, "C", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(alt_hyper, "D", function()
  hs.application.launchOrFocus("Dia")
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

hs.hotkey.bind(alt_hyper, "N", function()
  hs.application.launchOrFocus("NetNewsWire")
end)

hs.hotkey.bind(alt_hyper, "O", function()
  hs.application.launchOrFocus("1Password")
end)

hs.hotkey.bind(alt_hyper, "P", function()
  hs.application.launchOrFocus("Planner")
end)

function openFirefoxTabSearch()
  hs.application.launchOrFocus("Firefox")
  hs.timer.doAfter(0.3, function()
    hs.eventtap.keyStroke({ "cmd" }, "l") -- Focus address bar
    hs.timer.doAfter(0.1, function()
      hs.eventtap.keyStrokes("% ")        -- Type % followed by space to search tabs
    end)
  end)
end

hs.hotkey.bind(alt_hyper, "T", openFirefoxTabSearch)

---- Hotkey to show/hide the Ghostty terminal app window (currently using tmux with a quick terminal so this is not really used)
--hs.hotkey.bind(alt_hyper, "T", function()
--  local currentApp = hs.application.frontmostApplication()
--  local currentSpace = hs.spaces.focusedSpace()
--  local targetApp = hs.application.get(appGhostty)
--
--  if targetApp and targetApp:isFrontmost() then
--    -- If Ghostty is active, switch back
--    if previousApp and previousApp:name() ~= "Finder" then
--      previousApp:activate()
--    elseif previousSpace then
--      hs.spaces.gotoSpace(previousSpace)
--    else
--      hs.eventtap.keyStroke({ "ctrl" }, "Up") -- Open Mission Control as a fallback
--    end
--  else
--    -- Store current app and space before switching
--    if currentApp:name() ~= "Finder" then
--      previousApp = currentApp
--    end
--    previousSpace = currentSpace
--
--    if targetApp then
--      -- Attempt to select the first window from the Window menu
--      local menuItems = targetApp:getMenuItems()
--      if menuItems and menuItems["Window"] then
--        local windowMenu = menuItems["Window"]
--        for _, item in ipairs(windowMenu) do
--          if item.AXTitle and not item.AXRole then
--            targetApp:selectMenuItem(item.AXTitle)
--            break -- Select the first valid window
--          end
--        end
--      end
--
--      -- Ensure Ghostty's window is focused
--      local win = targetApp:mainWindow()
--      if win then
--        win:focus()
--      else
--        hs.application.launchOrFocus(appGhostty)
--      end
--    else
--      hs.application.launchOrFocus(appGhostty)
--    end
--  end
--end)

hs.hotkey.bind(alt_hyper, "W", function()
  hs.application.launchOrFocus("Fantastical")
end)

local localfile = hs.configdir .. "/init-local.lua"
if hs.fs.attributes(localfile) then
  dofile(localfile)
end

hs.alert.show("Hammerspoon Config Loaded")
