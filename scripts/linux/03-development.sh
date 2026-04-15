#!/bin/sh

echo "Installing coding languages and tools"
yay -S --noconfirm --needed \
  git neovim lazygit git-delta  \
  nodejs npm go hugo just

echo "Creating Project directories"
mkdir -p ~/Projects/personal
mkdir -p ~/Projects/work
mkdir -p ~/Projects/plugins

