case $1 in
    d)
        cliphist list | rofi -dmenu -replace -window-title "" | cliphist delete
    ;;
    w)    
        cliphist wipe
    ;;
    *)
        cliphist list | rofi -dmenu -replace -window-title "" | cliphist decode | wl-copy
    ;;
esac

