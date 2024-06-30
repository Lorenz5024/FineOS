#!/usr/bin/env sh 

# enable wanted monitors
hyprctl keyword monitor "DP-1, 2560x1440@165, 0x0, 1, vrr, 1"
hyprctl keyword monitor "DP-2, 2560x1440@75, -2560x0, 1"

# disable unwanted monitors
hyprctl keyword monitor "HDMI-A-1, disable"
