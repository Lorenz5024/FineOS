#!/usr/bin/env sh
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */ 

# WALLPAPERS PATH
wallDIR="$HOME/Pictures/wallpapers"

# Retrieve image files
PICS=($(find "${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME=". random"

# Rofi command
rofi_command="rofi -i -show -dmenu -config ~/FineOS/user/app/rofi/config-wallpaper.rasi -window-title Wallpaper:"


# Sorting Wallpapers
menu() {
  sorted_options=($(printf '%s\n' "${PICS[@]}" | sort))
  # Place ". random" at the beginning
  printf "%s\n" "$RANDOM_PIC_NAME"
  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")
    # Displaying .gif to indicate animated images
    if [[ -z $(echo "$pic_name" | grep -i "\.gif$") ]]; then
      printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
    else
      printf "%s\n" "$pic_name"
    fi
  done
}

# Choice of wallpapers
main() {
  choice=$(menu | ${rofi_command})
  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
    hyprctl hyprpaper preload "${RANDOM_PIC}"
    hyprctl hyprpaper wallpaper ",${RANDOM_PIC}"
    cp ${RANDOM_PIC} /home/lorenz/FineOS/themes/wallpaper
    exit 0
  fi

  # Find the index of the selected file
  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    echo "${PICS[$pic_index]}"
    hyprctl hyprpaper preload "${PICS[$pic_index]}"
    hyprctl hyprpaper wallpaper ",${PICS[$pic_index]}"
    cp ${PICS[$pic_index]} /home/lorenz/FineOS/themes/wallpaper
  else
    echo "Image not found."
    exit 1
  fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main
