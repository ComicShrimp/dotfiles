#!/bin/sh

LINUX_INSTALL_FOLDER="./scripts/linux"

# Exit immediately if a command exits with a non-zero status
set -e # Exit immediately if a command exits with a non-zero status

# Install scripts

source $LINUX_INSTALL_FOLDER/1-yay.sh # Yay install
source $LINUX_INSTALL_FOLDER/2-pacman.sh # Pacman Conf
source $LINUX_INSTALL_FOLDER/development.sh # bluetooth install
source $LINUX_INSTALL_FOLDER/terminal.sh # General tools used in terminal Install
source $LINUX_INSTALL_FOLDER/docker.sh # Docker Install
source $LINUX_INSTALL_FOLDER/theme.sh # Theme Install
source $LINUX_INSTALL_FOLDER/firewall.sh # Firewall Install
source $LINUX_INSTALL_FOLDER/power.sh # Firewall Install
source $LINUX_INSTALL_FOLDER/programs.sh # programs Install
source $LINUX_INSTALL_FOLDER/fonts.sh # programs Install
source $LINUX_INSTALL_FOLDER/network.sh # programs Install
source $LINUX_INSTALL_FOLDER/printer.sh

# Login
source $LINUX_INSTALL_FOLDER/login/plymouth.sh
source $LINUX_INSTALL_FOLDER/login/limine-snapper.sh
source $LINUX_INSTALL_FOLDER/login/alt-bootloaders.sh

# Change default terminal
chsh -s $(which zsh)

# Final Step - Update the system
echo "Updating the system"
sudo pacman -Syu --noconfirm

echo "Installation ended!."
