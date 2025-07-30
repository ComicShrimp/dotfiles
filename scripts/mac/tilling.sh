#!/bin/sh

# Install aerospace
brew install --cask nikitabobko/tap/aerospace

echo "Aerospace installed. Please open 'Aerospace' in app laucher to start using."

# Scketchybar

echo "Adding tap for Sketchybar"
brew tap FelixKratz/formulae

echo "Installing sketchybar"
brew install sketchybar

echo "Starting sketchybar service"
brew services start sketchybar
