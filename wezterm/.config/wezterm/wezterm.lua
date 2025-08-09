-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
-- ░█░█░█▀▀░▀▀█░▀█▀░█▀▀░█▀▄░█▄█░░░░█░░░█░█░█▀█░
-- ░█▄█░█▀▀░▄▀░░░█░░█▀▀░█▀▄░█░█░░░░█░░░█░█░█▀█░
-- ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀░▀░▀░░▀▀▀░▀▀▀░▀░▀░
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--
-- https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")
--local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
  -- Available Colorschemes:
  -- https://wezterm.org/colorschemes/index.html
  if appearance:find("Dark") then
    -- return 'Builtin Tango Dark'
    -- return 'Catppuccin Mocha'
    -- return 'Embers (dark) (terminal.sexy)'
    -- return 'GitHub Dark'
    -- return 'GruvboxDark'
    return "Classic Dark (base16)"
  else
    -- return 'Builtin Tango Light'
    -- return 'Catppuccin Latte'
    -- return 'Embers (light) (terminal.sexy)'
    -- return 'Github'
    -- return 'GruvboxLight'
    return "Classic Light (base16)"
  end
end

return {

  -- https://wezterm.org/config/appearance.html#color-scheme
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),

  colors = { cursor_bg = "#f5c2e7" },

  font = wezterm.font_with_fallback({
    "Ubuntu Mono",
    "Symbols Nerd Font Mono",
  }),

  font_size = 18,

  enable_tab_bar = false,

  bold_brightens_ansi_colors = true,

  adjust_window_size_when_changing_font_size = false,

  window_decorations = "RESIZE",

  window_padding = {
    left = 20,
    right = 20,
    top = 10,
    bottom = 10,
  },
}
