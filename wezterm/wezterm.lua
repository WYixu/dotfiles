-- -------------------------------------------------------------------
-- rxyhn's aesthetic wezterm configuration
-- A GPU-accelerated cross-platform terminal emulator and multiplexer
--
-- https://github.com/rxyhn
-- -------------------------------------------------------------------

local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "Source Han Sans CN" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "JetBrainsMono Nerd Font"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	-- Font config
	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true }),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback(font_name, { italic = true, weight = "ExtraBold" }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { weight = "ExtraBold" }),
		},
	},
	warn_about_missing_glyphs = false,
	font_size = 11,
	line_height = 1.0,

	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- X11
	enable_wayland = false,

	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	colors = {
		foreground = "#a7aab0",
		background = "#232326",
		cursor_bg = "#a7aab0",
		cursor_fg = "#232326",
		cursor_border = "#232326",
		selection_fg = "#101012",
		selection_bg = "#a7aab0",
		scrollbar_thumb = "#edeff0",
		split = "#090909",
		ansi = { "#101012", "#833b3b", "#85b573", "#dbb671", "#57a5e5", "#79428a", "#2b5b63", "#818387" },
		brights = { "#5a5b5e", "#de5d68", "#8fb573", "#e2c792", "#68aee8", "#bb70d2", "#51a8b3", "#a7aab0" },
		indexed = { [136] = "#a7aab0" },
	},

	-- Padding
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Tab Bar
	enable_tab_bar = false,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	window_frame = { active_titlebar_bg = "#090909", font = font_with_fallback(font_name, { bold = true }) },
}
