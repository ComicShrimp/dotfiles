#!/bin/sh

LINUX_INSTALL_FOLDER="./scripts/linux"

# Exit immediately if a command exits with a non-zero status
set -e # Exit immediately if a command exits with a non-zero status

# Install scripts

source $LINUX_INSTALL_FOLDER/yay.sh # Yay install
source $LINUX_INSTALL_FOLDER/hyprland.sh # Hyprland Install
source $LINUX_INSTALL_FOLDER/terminal.sh # General tools used in terminal Install

# Final Step - Update the system

echo "Updating the system"
sudo pacman -Syu --noconfirm
