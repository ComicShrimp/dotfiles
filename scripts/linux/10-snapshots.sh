#!/bin/bash

# Install packages for creating snapshots in system update and make it avaiable at boot
yay -S --noconfirm --needed snap-pac limine-snapper-sync

# Enable service
sudo systemctl enable --now limine-snapper-sync.service
