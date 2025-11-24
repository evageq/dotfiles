#!/bin/bash

exec 200>/tmp/waybar-launch.lock
flock -n 200 || exit 0

killall waybar || true
pkill waybar || true
sleep 0.5

config_file="config"
style_file="style.css"

waybar -c ~/.config/waybar/modules.jsonc -s ~/.config/waybar/style.css
#waybar

flock -u 200
exec 200>&-


