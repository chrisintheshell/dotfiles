-- General

hs.logger.defaultLogLevel = "info"

alt_hyper = { "cmd", "ctrl" }
hyper = { "cmd", "alt", "ctrl" }
shift_hyper = { "cmd", "alt", "ctrl", "shift" }

-- Spoon Management

hs.loadSpoon("SpoonInstall")

-- Constants

-- Keybindings

hs.hotkey.bind(hyper, "1", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(hyper, "2", function()
  hs.application.launchOrFocus("Mail")
end)

hs.hotkey.bind(hyper, "3", function()
  hs.application.launchOrFocus("Mimestream")
end)

hs.hotkey.bind(hyper, "4", function()
  hs.application.launchOrFocus("Bear")
end)

hs.hotkey.bind(hyper, "5", function()
  hs.application.launchOrFocus("Things3")
end)

hs.hotkey.bind(hyper, "C", function()
  hs.application.launchOrFocus("Calendar")
end)

hs.hotkey.bind(hyper, "E", function()
  hs.application.launchOrFocus("Zed")
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

hs.hotkey.bind(hyper, "F", openFirefoxTabSearch)

hs.hotkey.bind(hyper, "G", function()
  hs.application.launchOrFocus("GoodLinks")
end)

-- Hotkey to copy message ID from an email using message:// URL scheme
hs.hotkey.bind(hyper, "M", function()
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

hs.hotkey.bind(hyper, "N", function()
  hs.application.launchOrFocus("NetNewsWire")
end)

hs.hotkey.bind(hyper, "P", function()
  hs.application.launchOrFocus("1Password")
end)

hs.hotkey.bind(hyper, "T", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

hs.hotkey.bind(hyper, "W", function()
  hs.application.launchOrFocus("Fantastical")
end)

local localfile = hs.configdir .. "/init-local.lua"
if hs.fs.attributes(localfile) then
  dofile(localfile)
end

hs.alert.show("Hammerspoon Config Loaded")
