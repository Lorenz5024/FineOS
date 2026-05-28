#!/bin/sh

choice=$(printf "Lock\nReboot\nHibernate\nLogout\nSuspend\nShutdown" | rofi -dmenu -i -p "Power")

case "$choice" in
  Shutdown)
    hyprshutdown -t "Shutting down..." --post-cmd "shutdown -P 0"
    ;;
  Reboot)
    hyprshutdown -t "Restarting..." --post-cmd "reboot"
    ;;
  Hibernate)
    systemctl hibernate
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Suspend)
    systemctl suspend
    ;;
  Lock)
    hyprlock
    ;;
esac
