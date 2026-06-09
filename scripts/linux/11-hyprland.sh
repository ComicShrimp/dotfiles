#!/bin/sh

# Base Packages
yay -S --noconfirm --needed \
  waybar rofi \
  mako nautilus pavucontrol \
  xdg-desktop-portal-hyprland \
  hyprpolkitagent qt5-wayland qt6-wayland \
  brightnessctl playerctl \
  nwg-look gnome-themes-extra qt6ct

# Waybar nice to have
yay -S --noconfirm --needed \
  python-setuptools zscroll

yay -S --noconfirm --needed \
  hyprpaper hypridle hyprlock hyprshutdown \
  swayosd hyprlock hypridle hyprpaper \
  bluetui
