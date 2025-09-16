#!/bin/sh

# Disable the SDDM service to prevent start at boot
sudo systemctl disable sddm.service
