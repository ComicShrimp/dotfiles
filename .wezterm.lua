local wezterm = require("wezterm")

local config = wezterm.config_builder()
local mux = wezterm.mux

config.color_scheme = "tokyonight_night"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.native_macos_fullscreen_mode = true
config.window_decorations = "RESIZE"

-- Start in fullscreen
-- wezterm.on("gui-startup", function(cmd)
--   local _, _, window = mux.spawn_window(cmd or {})
--   window:gui_window():toggle_fullscreen()
-- end)

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
