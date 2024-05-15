#!/bin/sh

PACKAGES_FILE="./scripts/packages"

packages=$(cat $PACKAGES_FILE )


echo "Installing required packages..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac OS detected. Using homebrew"
    xargs brew install < "$PACKAGES_FILE"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected. Using pacman"
    xargs sudo pacman -S < "$PACKAGES_FILE"
else
    echo "Unknown operating system."
fi

