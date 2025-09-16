#!/bin/bash

# System Programs
yay -S --noconfirm --needed \
  waybar \
  brightnessctl \
  swayosd \
  playerctl \
  btop \
  powertop \
  flatpak \
  mako \
  nautilus \
  gvfs-smb \
  swaybg \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-hyprland \
  qt5-wayland \
  qt6-wayland \
  grim \
  slurp \
  wireless-regdb \
  polkit-gnome \
  wiremix \
  walker-bin \
  uwsm \
  hyprland \
  cups \
  cups-browsed \
  cups-filters \
  cups-pdf \
  blueberry

# Programs
yay -S --noconfirm --needed \
  obsidian \
  steam

# Flatpak Programs
flatpak install \
  app.zen_browser.zen
