#!/bin/sh

# Change color theme

theme_dir="$HOME/.dotfiles/wal/colorschemes/"

printf "Themes: \n$(ls $theme_dir)\n"

read -p "Enter theme: " theme 

wal -s --theme $theme_dir$theme

pkill waybar
waybar &
