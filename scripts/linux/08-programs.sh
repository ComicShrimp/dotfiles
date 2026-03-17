#!/bin/bash

# Programs
yay -S --noconfirm --needed \
  obsidian \
  google-chrome \
  btop \
  powertop \
  flatpak \
  timeshift

# Flatpak Programs
flatpak install \
  app.zen_browser.zen \
  it.mijorus.gearlever \
  com.bitwarden.desktop \
  org.videolan.VLC \
  org.onlyoffice.desktopeditors \
  org.gnome.Firmware \
  com.prusa3d.PrusaSlicer \
  com.github.tchx84.Flatseal \
  com.discordapp.Discord \
  com.calibre_ebook.calibre
