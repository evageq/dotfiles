#!/bin/bash

current_workspace=$(hyprctl activewindow -j | jq '.workspace.id')

windows_count=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $current_workspace)] | length")

if [[ $windows_count > 2 ]]; then
    #vim mode
    case $1 in
        j | J)
            hyprctl dispatch movefocus d
            ;;
        k | K)
            hyprctl dispatch movefocus u
            ;;
        h | H)
            hyprctl dispatch movefocus l
            ;;
        l | L)
            hyprctl dispatch movefocus r
            ;;
        *)
            exit -1
            ;;
    esac
else
    #smart mode
    case $1 in
        j | J)
            hyprctl dispatch cyclenext none
            ;;
        k | K)
            hyprctl dispatch cyclenext prev
            ;;
        h | H)
            hyprctl dispatch movefocus l
            ;;
        l | L)
            hyprctl dispatch movefocus r
            ;;
        *)
            exit -1
            ;;
    esac
fi
