#!/bin/sh
# dmenu-based directory browser
# to run from terminal:
#    source /path/to/dbdb.sh
# or bind it to shortcut:
#   echo bind \'\"\\C-o\":\"source /path/to/dbdb.sh\\n\"\' >> ~/.bashrc

chosen="placeholder"

while [ ! -z "$chosen" ]; do
    DIRs=$( ls -a1p | grep -P '^\w[^\$/]+/$' | awk -vRS="\n" -vORS="\t" '1')
    DOTDs=$( ls -a1p | grep -P '^\.[^\$/]+/$' | awk -vRS="\n" -vORS="\t" '1')
    FILEs=$( ls -a1p | grep -P '^\w[^\$/]+$' | awk -vRS="\n" -vORS=" \t" '1')
    DOTFs=$( ls -a1p | grep -P '^\.[^\$/]+$' | awk -vRS="\n" -vORS=" \t" '1')
    clear && ls -lah
    chosen=`( ( echo -e "$DIRs$DOTDs" | awk -vRS="\t" -vORS="\n" '1' ) | dmenu -i )`
    if [ ! -z "$chose" ]; then
        cd "$chosen"
    fi
done
