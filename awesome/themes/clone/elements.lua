local color = require("themes.clone.color")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

theme.font          = "Roboto Medium 8" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "JetBrainsMono Nerd Font Medium 8"

theme.useless_gap   = dpi(2)

theme.border_width  = dpi(1)

theme.border_radius = dpi(16)

theme.border_normal = color.color['grey500']
theme.border_focus  = color.color['black']
theme.border_marked = color.color['orange500']

theme.bg_normal     = color.color['grey800']
theme.bg_focus      = color.color['grey800']
theme.bg_urgent     = color.color['grey800']
theme.bg_minimize   = color.color['grey800']
theme.bg_systray    = color.color['grey800']

theme.fg_normal     = color.color['white']
theme.fg_focus      = color.color['blue300']
theme.fg_urgent     = color.color['red300']
theme.fg_minimize   = color.color['white']

theme.taglist_bg_focus = color.color['grey900']
theme.taglist_fg_focus = color.color['blue300']

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, color.color['blue300']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, color.color['white']
)

theme.tasklist_bg_normal = color.color['grey800']
theme.tasklist_bg_focus  = color.color['grey900']
theme.tasklist_fg_focus  = color.color['blue300']

theme.titlebar_bg_normal = color.color['grey800']
theme.titlebar_bg_focus  = color.color['black']
theme.titlebar_fg_focus  = color.color['blue300'] 

