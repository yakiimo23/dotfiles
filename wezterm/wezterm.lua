require 'format'

local wezterm = require 'wezterm';

local config = wezterm.config_builder();

-- color scheme
config.color_scheme = 'tokyonight';

-- font
config.font = wezterm.font('JetBrains Mono', { weight='Regular' });
config.font_size = 18.0;

-- key bindings
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 2000 };
config.keys = require('keybinds').keys;
config.key_tables = require('keybinds').key_tables;

-- status bar
config.status_update_interval = 1000;

return config;
