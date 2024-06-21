#!/usr/bin/env sh

# Rofi command
rofi_command="rofi -i -show -dmenu -window-title Sound-Output:"

# Gets all connected audio devices
menu() {
  wpctl status | pcregrep -M "Audio\n ├─ Devices:(.|\n)*?Sinks" | tail -n +3 | head -n -2 | cut -c11-
}

main() {
  choice=$(menu | ${rofi_command})
  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  device_id=$(echo $choice | head -c 2)

  wpctl set-default $device_id
 
}

main
