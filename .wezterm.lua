-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {
	force_reverse_video_cursor = true,
	colors = {
		foreground = "#e0def4", -- Rosé Pine Foreground
		background = "#191724", -- Rosé Pine Background

		cursor_bg = "#e0def4",
		cursor_fg = "#191724",
		cursor_border = "#e0def4",
	
		selection_fg = "#e0def4",
		selection_bg = "#403d52",
	
		scrollbar_thumb = "#191724",
		split = "#26233a",
	
		ansi = { "#6e6a86", "#eb6f92", "#9ccfd8", "#f6c177", "#c4a7e7", "#ea9a97", "#3e8fb0", "#e0def4" },
		brights = { "#6e6a86", "#eb6f92", "#9ccfd8", "#f6c177", "#c4a7e7", "#ea9a97", "#3e8fb0", "#e0def4" },
		indexed = { [16] = "#f6c177", [17] = "#ebbcba" },
	},
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Apply Rosé Pine color scheme
config.force_reverse_video_cursor = true
config.colors = {}
config.colors.foreground = "#e0def4" -- Rosé Pine Foreground
config.colors.background = "#191724" -- Rosé Pine Background
config.colors.cursor_bg = "#e0def4"
config.colors.cursor_fg = "#191724"
config.colors.cursor_border = "#e0def4"
config.colors.selection_fg = "#e0def4"
config.colors.selection_bg = "#403d52"
config.colors.scrollbar_thumb = "#191724"
config.colors.split = "#26233a"
config.colors.ansi = { "#6e6a86", "#eb6f92", "#9ccfd8", "#f6c177", "#c4a7e7", "#ea9a97", "#3e8fb0", "#e0def4" }
config.colors.brights = { "#6e6a86", "#eb6f92", "#9ccfd8", "#f6c177", "#c4a7e7", "#ea9a97", "#3e8fb0", "#e0def4" }
config.colors.indexed = { [16] = "#f6c177", [17] = "#ebbcba" }

-- Additional configurations
config.window_background_opacity = 1
config.cursor_blink_rate = 200
config.font = wezterm.font 'Iosevka NF Medium'
config.font_size = 14.0
config.default_domain = 'WSL:Ubuntu'
config.front_end = "WebGpu"
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Vulkan" then
		config.webgpu_preferred_adapter = gpu
		break
	end
end

-- Add window decorations and disable tab bar
config.window_decorations = "RESIZE"  -- disable the title bar but enable the resizable border
config.enable_tab_bar = false          -- disable the tab bar

-- Set the terminal to open with a fixed size
config.initial_cols = 120  -- Set the number of columns to 140
config.initial_rows = 30   -- Set the number of rows to 35

-- and finally, return the configuration to wezterm
return config
