-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Error handling
require("main.error-handling")

RC = {} -- global namespace

RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("/home/yxwang/.config/awesome/themes/clone/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = RC.vars.terminal
editor = RC.vars.editor
editor_cmd = terminal .. " -e " .. editor

local main = {
  layouts = require("main.layouts"),
  tags = require("main.tags"),
  rules = require("main.rules"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys = require("binding.globalkeys"),
  clientkeys = require("binding.clientkeys"),
  bindtotags = require("binding.bindtotags"),
}

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Rules
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

require("deco.statusbar")

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Signals
require("main.signals")

require("main.autostart")
