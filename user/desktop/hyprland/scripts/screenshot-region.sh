#!/bin/sh 

# Check if screenshot directory exists
if [ ! -d ~/Pictures/screenshot ]
then 
  mkdir ~/Pictures/screenshot
fi

# take screenshot
grim -g "$(slurp)" ~/Pictures/screenshot/$(date +'%s_grim.png')
