local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local helpers = require("helpers")

--- Notification Panel
--- ~~~~~~~~~~~~~~~~~~

return function(s)
	s.notification_panel = awful.popup({
		type = "dock",
		screen = s,
		minimum_height = s.geometry.height - (beautiful.wibar_height + dpi(10)),
		maximum_height = s.geometry.height - (beautiful.wibar_height + dpi(10)),
		minimum_width = dpi(370),
		maximum_width = dpi(370),
		bg = beautiful.transparent,
		ontop = true,
		visible = false,
		placement = function(w)
			awful.placement.top_right(w)
			awful.placement.maximize_vertically(
				w,
				{ honor_workarea = true, margins = { top = beautiful.useless_gap * 2 } }
			)
		end,
		widget = {
			{
				{ ----------- TOP GROUP -----------
					{
            require("ui.panels.notification-panel.user-profile"),
						margins = dpi(1),
						widget = wibox.container.margin,
					},
					layout = wibox.layout.fixed.vertical,
				},
				{ ----------- TOP GROUP -----------
					{
            require("ui.panels.notification-panel.quick-settings"),
						margins = dpi(1),
						widget = wibox.container.margin,
					},
					layout = wibox.layout.fixed.vertical,
				},
				{ ----------- TOP GROUP -----------
					{
            require("ui.panels.notification-panel.slider"),
						margins = dpi(1),
						widget = wibox.container.margin,
					},
					layout = wibox.layout.fixed.vertical,
				},
				{ ----------- TOP GROUP -----------
					{
            require("ui.panels.notification-panel.notif-center")(s),
						margins = dpi(1),
						widget = wibox.container.margin,
					},
					layout = wibox.layout.fixed.vertical,
				},
				layout = wibox.layout.fixed.vertical,
			},
			shape = helpers.ui.prrect(beautiful.border_radius * 2, true, false, false, false),
			bg = beautiful.wibar_bg,
			widget = wibox.container.background,
		},
	})

	--- Toggle container visibility
	awesome.connect_signal("notification_panel::toggle", function(scr)
		if scr == s then
			s.notification_panel.visible = not s.notification_panel.visible
		end
	end)
end
