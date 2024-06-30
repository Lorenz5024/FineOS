#!/usr/bin/env sh 

# enable wanted monitors
hyprctl keyword monitor "HDMI-A-1, 3840x2160@60, -642x-2160, 1, bitdepth, 10, vrr, 2"

# disable unwanted monitors
hyprctl keyword monitor "DP-1, disable"
hyprctl keyword monitor "DP-2, disable"
