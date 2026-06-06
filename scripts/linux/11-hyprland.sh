#!/bin/sh

yay -S --noconfirm --needed \
  waybar rofi \
  mako nautilus pavucontrol \
  xdg-desktop-portal-hyprland \
  hyprpolkitagent qt5-wayland qt6-wayland \
  brightnessctl playerctl \
  nwg-look gnome-themes-extra qt6ct

yay -S --noconfirm --needed \
  hyprpaper hypridle hyprlock hyprshutdown \
  brightnessctl playerctl \
  swayosd hyprlock hypridle hyprpaper \
  bluetui
