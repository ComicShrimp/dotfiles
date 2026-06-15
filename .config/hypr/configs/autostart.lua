-------------------
---- AUTOSTART ----
-------------------

-- waybar and hyprpolkitagent are managed by systemd (see scripts/linux/11-hyprland.sh)
hl.on("hyprland.start", function()
  hl.exec_cmd("playerctld daemon")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("swayosd-server")
end)
