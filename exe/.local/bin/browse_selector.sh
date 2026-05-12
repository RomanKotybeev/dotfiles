#!/bin/sh

choice=$(printf "Vivaldi\nChromium\nFirefox"  | rofi -dmenu -i)

case "$choice" in
    "Vivaldi") vivaldi-stable --ozone-platform=wayland ;;
    "Chromium") chromium --ozone-platform=wayland ;;
    "Firefox") MOZ_ENABLE_WAYLAND=1 firefox ;;
    *) exit 0 ;;
esac
