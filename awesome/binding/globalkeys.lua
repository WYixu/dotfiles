-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")
local utils = require("app.utils")
local helpers = require("app.helpers")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal
local app_launcher = RC.vars.app_launcher

local _M = {}

function _M.get()
  local globalkeys = gears.table.join(
    -- Terminal
    awful.key({ modkey }, "Return", function()
      awful.spawn(terminal) 
    end, { description = "open terminal", group = "app" }),
    
    -- Launcher
    awful.key({ modkey }, "d", function()
      awful.spawn.with_shell(app_launcher) 
    end, { description = "open app launcher", group = "app" }),

    -- Restart awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "WM" }),

    -- Quit awesome
    awful.key({ modkey, "Control" }, "q", awesome.quit,
    { description = "quit awesome", group = "WM" }),

    -- Show help
    awful.key({ modkey }, "F1", hotkeys_popup.show_help, 
    { description = "show help", group = "WM" }),

    -- Focus client by direction
    awful.key({ modkey }, "k", function()
      awful.client.focus.bydirection("up")
    end, { description = "focus up", group = "client" }),
    awful.key({ modkey }, "j", function()
      awful.client.focus.bydirection("down")
    end, { description = "focus down", group = "client" }),
    awful.key({ modkey }, "h", function()
      awful.client.focus.bydirection("left")
    end, { description = "focus left", group = "client" }),
    awful.key({ modkey }, "l", function()
      awful.client.focus.bydirection("right")
    end, { description = "focus right", group = "client" }),

    -- Resize focused client
    awful.key({ modkey, "Control" }, "k", function(c)
      helpers.client.resize_client(client.focus, "up")
    end, { description = "resize to the up", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function(c)
      helpers.client.resize_client(client.focus, "down")
    end, { description = "resize to the down", group = "client" }),
    awful.key({ modkey, "Control" }, "h", function(c)
      helpers.client.resize_client(client.focus, "left")
    end, { description = "resize to the left", group = "client" }),
    awful.key({ modkey, "Control" }, "l", function(c)
      helpers.client.resize_client(client.focus, "right")
    end, { description = "resize to the right", group = "client" }),

    -- Brightness Control
    awful.key({}, "XF86MonBrightnessUp", function()
      awful.spawn("brightnessctl set 5%+ -q", false)
      awesome.emit_signal("widget::brightness")
      awesome.emit_signal("module::brightness_osd:show", true)
    end, { description = "increase brightness", group = "hotkeys" }),
    awful.key({}, "XF86MonBrightnessDown", function()
      awful.spawn("brightnessctl set 5%- -q", false)
      awesome.emit_signal("widget::brightness")
      awesome.emit_signal("module::brightness_osd:show", true)
    end, { description = "decrease brightness", group = "hotkeys" }),

    -- Volume Control
    awful.key({}, "XF86AudioRaiseVolume", function()
      awful.spawn("amixer sset Master 5%+", false)
      awesome.emit_signal("widget::volume")
      awesome.emit_signal("module::volume_osd:show", true)
    end, { description = "increase volume", group = "hotkeys" }),
    awful.key({}, "XF86AudioLowerVolume", function()
      awful.spawn("amixer sset Master 5%-", false)
      awesome.emit_signal("widget::volume")
      awesome.emit_signal("module::volume_osd:show", true)
    end, { description = "decrease volume", group = "hotkeys" }),
    awful.key({}, "XF86AudioMute", function()
      awful.spawn("amixer sset Master toggle", false)
    end, { description = "mute volume", group = "hotkeys" }),

    -- Screenshots
    awful.key({}, "Print", function()
      awful.spawn.easy_async_with_shell(utils.full_screenshot, function() end)
    end, { description = "take a full screenshot", group = "hotkeys" }),

    awful.key({ "Alt" }, "Print", function()
      awful.spawn.easy_async_with_shell(utils.area_screenshot, function() end)
    end, { description = "take a area screenshot", group = "hotkeys" }),

    --- Exit screen
    awful.key({ modkey }, "Escape", function()
      awesome.emit_signal("module::exit_screen:show")
    end, { description = "exit screen", group = "hotkeys" })
  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
