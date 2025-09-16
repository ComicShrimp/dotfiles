#!/bin/sh

# Disable the SDDM service to prevent start at boot
sudo systemctl disable sddm.service

# Remove the SDDM package
sudo pacman -Rs sddm

echo "SDDM has been stopped, disabled, and removed."
