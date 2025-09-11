require("format")

local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "tokyonight"

-- opacity
config.window_background_opacity = 0.9

-- font
config.font = wezterm.font("HackGen Console NF", { weight = "Regular" })
config.font_size = 22.0

-- key bindings
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

-- status bar
config.status_update_interval = 1000

-- scrollback
config.scrollback_lines = 50000

return config
