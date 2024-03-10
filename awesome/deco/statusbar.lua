-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _M = {}

local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist = require("deco.taglist"),
  tasklist = require("deco.tasklist"),
}

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()

local mytextclock = wibox.widget.textclock()
local mysystay = wibox.widget.systray()
mysystay.set_base_size(dpi(20))

-- Wibar

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget 
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })
  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      mysystay,
      mytextclock,
      s.mylayoutbox,
    },
  }
end)
