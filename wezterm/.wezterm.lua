local wezterm = require 'wezterm';

local config = wezterm.config_builder();

-- color scheme
config.color_scheme = 'tokyonight';

-- font
config.font = wezterm.font('JetBrains Mono', { weight='Regular' });
config.font_size = 16.0;

-- key bindings
config.keys = {
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|ALT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CMD|ALT',
    action = wezterm.action.MoveTabRelative(1),
  }
}

return config;
