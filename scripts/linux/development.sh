#!/bin/sh

echo "Installing packages"
pacman -S --noconfirm --needed \
  git neovim lazygit git-delta  \
  nodejs npm go

echo "Creating Project directories"
mkdir -p ~/Projects/personal
mkdir -p ~/Projects/work
