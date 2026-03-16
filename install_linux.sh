#!/bin/sh

LINUX_INSTALL_FOLDER="./scripts/linux"

# Exit immediately if a command exits with a non-zero status
set -e # Exit immediately if a command exits with a non-zero status

# Install scripts

source $LINUX_INSTALL_FOLDER/1-yay.sh # Yay install
source $LINUX_INSTALL_FOLDER/2-pacman.sh # Pacman Conf
source $LINUX_INSTALL_FOLDER/3-development.sh # bluetooth install
source $LINUX_INSTALL_FOLDER/4-docker.sh # Docker Install
source $LINUX_INSTALL_FOLDER/5-terminal.sh # General tools used in terminal Install
source $LINUX_INSTALL_FOLDER/6-firewall.sh # Firewall Install
source $LINUX_INSTALL_FOLDER/7-fonts.sh # Fonts Install
source $LINUX_INSTALL_FOLDER/8-programs.sh # programs Install
source $LINUX_INSTALL_FOLDER/9-power.sh # Power Profile Install

# Change default terminal
chsh -s $(which zsh)

# Final Step - Update the system
echo "Updating the system"
sudo pacman -Syu --noconfirm

echo "Installation ended!."
