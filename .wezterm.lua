local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.native_macos_fullscreen_mode = true

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local _, pane, window = mux.spawn_window({})
  local gui_window = window:gui_window()
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

-- and finally, return the configuration to wezterm
return config
