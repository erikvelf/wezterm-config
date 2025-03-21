-- Config is based on: https://github.com/haphamdev/dot-files/tree/master/wezterm
local wezterm = require("wezterm")

-- Start full screen
-- wezterm.on("gui-startup", function()
--   local _, _, window = wezterm.mux.spawn_window({})
--   window:gui_window():toggle_fullscreen()
-- end)

local config = {}

-- Use config builder if possible
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Use both Option keys as Meta (Alt) key
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- GENERAL SETTINGS

-- Cursor settings
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 700
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Apply changes to the configuration without restarting the terminal
config.automatically_reload_config = true

-- front_end = "WebGpu", -- use WebGPU for rendering

-- Get the built-in color schemes
-- local schemes = wezterm.color.get_builtin_schemes()
--
-- Nice color schemes I like
config.color_scheme = 'tokyonight'
-- config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'tokyonight_storm'

-- Colors of the selection
config.colors = {
  selection_bg = '#FFFFFF',
  selection_fg = '#1a2531'
}

config.term = "xterm-256color" -- options are: "xterm-256color", "wezterm"

-- Font  settings --
config.font = wezterm.font_with_fallback({
  { family = "JetbrainsMono Nerd Font" },
})
config.font_size = 12.5
config.line_height = 1.2

config.window_background_opacity = 1.0 -- 1.0 is full opacity

-- Title bar settings
config.window_decorations = "TITLE" -- Other options are: "TITLE", "TITLE|RESIZE"

-- Set the padding around the terminal window
config.window_padding = { left = 15, right = 15, top = 5, bottom = 5 }

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.switch_to_last_active_tab_when_closing_tab = true
-- config.tab_max_width = 30

config.scrollback_lines = 5000
config.default_workspace = "HOME"
config.default_prog = { "/bin/zsh", "-l" }
config.status_update_interval = 1000

-- Dim inactive panes to distinguish them from the active pane
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.3,
}

-- Prompt for confirmation when closing a window if there are multiple panes
config.window_close_confirmation = "AlwaysPrompt" -- 'NeverPrompt'
config.warn_about_missing_glyphs = false

-- Load other configuration files
require("status-bar").apply_to_config(config)
require("tab-format").apply_to_config(config)
require("keymappings").apply_to_config(config)
require("plugins").apply_to_config(config)

return config
