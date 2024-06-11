#!/bin/sh

# Set scripts directory
scripts_dir="$HOME/.dotfiles/home-manager/desktop/scripts/"

# Set random wallpaper
$scripts_dir/HyprpaperRandomWallpaper.sh

# Set colors with pywal
$scripts_dir/PywalHyprpaper.sh

# Reload waybar
pkill waybar
waybar &
