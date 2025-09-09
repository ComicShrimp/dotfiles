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
  swaybg

# Programs
yay -S --noconfirm --needed \
  obsidian \
  steam

# Flatpak Programs
flatpak install \
  app.zen_browser.zen
