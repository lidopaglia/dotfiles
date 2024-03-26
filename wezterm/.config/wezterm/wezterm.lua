local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = false

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

config.bold_brightens_ansi_colors = true

config.font =
  wezterm.font_with_fallback {
    'Ubuntu Mono',
    'Symbols Nerd Font Mono'
  }

config.font_size = 13

return config
