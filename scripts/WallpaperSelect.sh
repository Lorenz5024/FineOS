#!/bin/sh
# This script is for selecting wallpapers

# Wallpapers Path
wallDir="$HOME/Pictures/wallpapers/"

# Get wallpapers
wallpapers=($(ls "${wallDir}" | grep -E ".jpg$|.jpeg$|.png$"))

# Rofi command
rofi_command="rofi -show -dmenu -p Wallpaper" 

# Cache for wallpaper
wal_cache="$HOME/.config/wallpaper"

menu() {
  for i in "${!wallpapers[@]}"; do 
    printf "${wallpapers[$i]}\n"
  done
}

main() {
  choice=$(menu | ${rofi_command})

  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Find index of the selected file
  wall_index=-1
  for i in "${!wallpapers[@]}"; do
    filename=$(basename "${wallpapers[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      wall_index=$i 
      break
    fi 
  done 

  wallpaper="${wallDir}/${wallpapers[$wall_index]}"

  cp $wallpaper $wal_cache

  if [[ $pic_index -ne -1 ]]; then
    pkill hyprpaper
    hyprpaper &
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $wal_cache
    hyprctl hyprpaper wallpaper ", ${wal_cache}"
  else 
    echo "Image not found"
    exit 1
  fi
}


# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi 
  exit 0
fi 

main
