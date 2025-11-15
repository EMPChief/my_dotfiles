-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ============================================================================
-- COLOR SCHEME
-- ============================================================================
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- ============================================================================
-- FONT CONFIGURATION
-- ============================================================================
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19
config.line_height = 1.2

-- Better font rendering
config.freetype_load_target = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"

-- ============================================================================
-- WINDOW APPEARANCE
-- ============================================================================
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- Uncomment for transparency (looks great with the dark theme!)
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 20

-- Window padding for a cleaner look
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- ============================================================================
-- CURSOR
-- ============================================================================
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 700
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- ============================================================================
-- SCROLLBACK
-- ============================================================================
config.scrollback_lines = 10000

-- ============================================================================
-- PERFORMANCE
-- ============================================================================
config.max_fps = 120
config.animation_fps = 60
config.front_end = "WebGpu" -- Use GPU acceleration

-- ============================================================================
-- MOUSE & SELECTION
-- ============================================================================
config.mouse_bindings = {
	-- Open URLs with Cmd+Click (Ctrl+Click on Linux/Windows)
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	-- Paste on right click
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- Double-click selects words with these characters
config.selection_word_boundary = " \t\n{}[]()\"'`│├─┤"

-- ============================================================================
-- HYPERLINKS
-- ============================================================================
-- Detect and make URLs clickable
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Make paths clickable too
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://github.com/$1/$3",
})

-- ============================================================================
-- KEY BINDINGS
-- ============================================================================
config.keys = {
	-- Split panes
	{
		key = "d",
		mods = "SUPER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Navigate panes
	{
		key = "h",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Close pane
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- Clear scrollback
	{
		key = "k",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	-- Reload config
	{
		key = "r",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

-- ============================================================================
-- BELL
-- ============================================================================
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}

-- ============================================================================
-- RETURN CONFIG
-- ============================================================================
return config
