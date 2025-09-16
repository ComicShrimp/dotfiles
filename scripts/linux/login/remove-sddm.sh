#!/bin/sh

# Stop the SDDM service
sudo systemctl stop sddm.service

# Disable the SDDM service to prevent start at boot
sudo systemctl disable sddm.service
