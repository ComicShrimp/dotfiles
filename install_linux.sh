#!/bin/sh

LINUX_INSTALL_FOLDER="./scripts/linux"

# Exit immediately if a command exits with a non-zero status
set -e # Exit immediately if a command exits with a non-zero status

# Install scripts

source $LINUX_INSTALL_FOLDER/01-yay.sh # Yay install (required for the other scripts)
source $LINUX_INSTALL_FOLDER/02-pacman.sh # Pacman Conf
source $LINUX_INSTALL_FOLDER/03-development.sh # bluetooth install
source $LINUX_INSTALL_FOLDER/04-docker.sh # Docker Install
source $LINUX_INSTALL_FOLDER/05-terminal.sh # General tools used in terminal Install
source $LINUX_INSTALL_FOLDER/06-firewall.sh # Firewall Install
source $LINUX_INSTALL_FOLDER/07-fonts.sh # Fonts Install
source $LINUX_INSTALL_FOLDER/08-programs.sh # programs Install
source $LINUX_INSTALL_FOLDER/09-power.sh # Power Profile Install
source $LINUX_INSTALL_FOLDER/10-snapshots.sh # Install and enable btrfs snapshots during boot

# Change default terminal
chsh -s $(which zsh)

# Final Step - Update the system
echo "Updating the system"
sudo pacman -Syu --noconfirm

echo "Installation ended!."
