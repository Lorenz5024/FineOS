#!/bin/sh

kscreen-doctor output.HDMI-A-1.disable output.DP-1.enable 

audio_sink_id=$(wpctl status \
    | awk '/Sinks:/{insinks=1; next} /Sources:/{insinks=0} insinks' \
    | grep "Fiio E10 Analog Stereo" \
    | grep -Eo '[0-9]+' \ 
    | head -n1 \
    | tr -d ' ')

wpctl set-default $audio_sink_id

# example from kscreen-doctor --help
# kscreen-doctor output.HDMI-2.disable output.eDP-1.mode.1 output.eDP-1.enable
