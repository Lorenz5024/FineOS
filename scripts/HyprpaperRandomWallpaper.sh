#!/bin/sh
# Set random wallpaper for hyprpaper

# Define path to wallpaper directory
wal_dir="$HOME/Pictures/wallpapers/"

# Define path to wallpaper cache
wal_cache="$HOME/.cache/hypr/wallpaper"

if [ -d "$wal_dir" ]; then
  random_wallpaper=$(ls $wal_dir/*.jpg $wal_dir/*.png | shuf -n 1)

  # Check if ~/.cache/hyprpaper/ exists, if not create it
  if [ ! -d "$HOME/.cache/hypr/" ]; then
    mkdir $HOME/.cache/hypr
  fi

  # Copy wallpaper to ~/.cache/hyprpaper/
  cp $random_wallpaper $wal_cache

  # Todo: reload wallpapers without killing hyprpaper every time
  pkill hyprpaper
  hyprpaper &

  hyprctl hyprpaper preload $random_wallpaper
  hyprctl hyprpaper wallpaper ", $random_wallpaper"
  hyprctl hyprpaper unload all
fi
