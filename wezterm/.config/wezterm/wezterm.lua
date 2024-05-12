-- WezTerm Config
-- https://wezfurlong.org/wezterm/config/files.html


local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = false

config.window_padding = {
  left = 20,
  right = 20,
  top = 10,
  bottom = 10,
}

config.window_decorations = "RESIZE"

config.bold_brightens_ansi_colors = true

config.color_scheme = 'Tomorrow Night'

config.colors = {
  background = 'black',
}

config.font = wezterm.font_with_fallback {
    'Ubuntu Mono',
    'Symbols Nerd Font Mono'
  }

config.font_size = 18

return config
