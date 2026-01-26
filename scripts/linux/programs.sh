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
  it.mijorus.gearlever
