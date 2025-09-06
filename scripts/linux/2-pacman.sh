#!/bin/sh

echo "Adding multilib repository for 32-bit compatibility"
sudo sed -i '/^#\s*\[multilib\]/,/^#\s*Include/ s/^#\s*//' /etc/pacman.conf

echo "Enabling Color in pacman"
sudo sed -i '/^#\s*Color/ s/^#\s*//' /etc/pacman.conf
