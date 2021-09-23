#!/bin/bash
set -eu

WALLPAPER_DIR="$HOME/wallpaper/"

wallpaper=$(find $WALLPAPER_DIR -maxdepth 1 -type f | shuf -n1 | sed 's/(/\\\(/g' | sed 's/)/\\\)/g' | sed "s/'/\\\'/g")
/usr/bin/swaymsg output '*' bg "$wallpaper" fit #000000
