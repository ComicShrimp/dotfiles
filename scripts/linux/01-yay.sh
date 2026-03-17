#!/bin/bash

# Install yay

if ! command -v yay &>/dev/null; then
  # Install build tools
  sudo pacman -Sy --needed --noconfirm base-devel

  cd /tmp
  rm -rf yay-bin

  git clone https://aur.archlinux.org/yay-bin.git

  cd yay-bin
  makepkg -si --noconfirm

  cd -
  rm -rf yay-bin
  cd ~/dotfiles # Return to dotfiles folder
fi
