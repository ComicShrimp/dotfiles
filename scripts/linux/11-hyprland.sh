#!/bin/sh

# Base Packages
yay -S --noconfirm --needed \
  waybar rofi \
  mako nautilus pavucontrol \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk \
  hyprpolkitagent qt5-wayland qt6-wayland \
  brightnessctl playerctl \
  gnome-themes-extra kvantum-qt5 uwsm

# Waybar nice to have
yay -S --noconfirm --needed \
  python-setuptools zscroll

# Lock and wallpaper
yay -S --noconfirm --needed \
  hyprpaper hypridle hyprlock hyprshutdown \
  swayosd hyprlock hypridle hyprpaper \
  bluetui

# Enable systemd user services
systemctl --user enable --now waybar.service
systemctl --user enable --now playerctld.socket
systemctl --user enable hyprpolkitagent.service
