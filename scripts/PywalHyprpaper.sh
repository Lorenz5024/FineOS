#!/bin/sh

# Define path to wallpaper cache
wal_cache="$HOME/.cache/hyprpaper/wallpaper"

# Delete cached colorschemes
wal -c

# Apply paywal to wallpaper
wal -i $wal_cache -s -t
