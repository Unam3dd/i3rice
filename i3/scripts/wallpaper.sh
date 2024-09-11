#!/bin/bash
# Author: Unam3dd

WALLPAPER_DIR=/usr/share/backgrounds/cyberpunk-wallpaper/

if [ ! -d $WALLPAPER_DIR ]; then
    echo -e "[\033[31m-\033[00m] $WALLPAPER_DIR not found !"
    exit 1
fi

if [ ! $(which feh) ]; then
    echo -e "[\033[31m-\033[00m] feh is not installed !"
    exit 1
fi

FILES=$(find $WALLPAPER_DIR -type f -name "wallpaper*.jpg" | shuf)

while [ 1 ]; do
    for f in $FILES; do
        feh --bg-fill $f
        sleep 300
    done
    FILES=$(echo $FILES | shuf)
done
