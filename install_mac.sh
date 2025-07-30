#!/bin/sh

MAC_INSTALL_FOLDER="./scripts/mac"

# Exit immediately if a command exits with a non-zero status
set -e # Exit immediately if a command exits with a non-zero status

# Install scripts

source $MAC_INSTALL_FOLDER/terminal.sh # General tools used in terminal Install
source $MAC_INSTALL_FOLDER/development.sh #  Dev deps Install
source $MAC_INSTALL_FOLDER/tilling.sh # Tolling goodies Install
source $MAC_INSTALL_FOLDER/casks.sh # homebrew casks goodies Install

# Final Step - Update the system

echo "Updating the system"
brew update
brew upgrade
