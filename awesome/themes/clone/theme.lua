local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "themes/clone/"

-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")

theme.wallpaper          = theme_path .. "background.png"

return theme
