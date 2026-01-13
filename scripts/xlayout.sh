#!/bin/bash

layout=$(setxkbmap -query | grep layout | cut -f2 -d":" | tr -d '[:space:]')

if [[ "$layout" = "us" ]]; then
    layout="ru"
else
    layout="us"
fi

setxkbmap "$layout"
