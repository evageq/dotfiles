#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
muted=$(echo "$volume" | grep MUTED)
if [[ ! -z "$muted" ]]; then
    echo mute
else
    echo $(echo "$volume" | awk -F ':' '{print $2}')
fi
