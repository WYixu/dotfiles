local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

local function autostart_apps()
	--- Compositor
	-- helpers.run.check_if_running("picom", nil, function()
		-- awful.spawn("picom --config " .. config_dir .. "configuration/picom.conf", false)
	-- end)
	--- Polkit Agent
	helpers.run.run_once_ps(
		"polkit-gnome-authentication-agent-1",
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
	)
	--- Other stuff
	helpers.run.run_once_grep("blueman-applet")
	helpers.run.run_once_grep("nm-applet")
	helpers.run.run_once_grep("fcitx5")
  helpers.run.run_once_grep("clash")
  -- helpers.run.run_once_ps(
    -- "clash-verge",
    -- "/home/wyx/Downloads/clash-verge_1.4.3_amd64.AppImage"
  -- )
  helpers.run.run_once_ps(
    "aria2c",
    "aria2c --enable-rpc"
  )
  helpers.run.run_once_grep("qbittorrent")
  helpers.run.run_once_grep("firefox")
  helpers.run.run_once_grep("krusader")
  helpers.run.run_once_grep("konversation")
end

autostart_apps()
