#!/bin/bash
set -eu

WALLPAPER_DIR="$HOME/wallpaper/"

export AWWW_TRANSITION_FPS=60
export AWWW_TRANSITION=fade
export AWWW_TRANSITION_DURATION=2
export AWWW_TRANSITION_STEP=220

# This controls (in seconds) when to switch to the next image
INTERVAL=${1:-60}

outputs=$(awww query | awk '{print $1}' | sed 's/://')
# wallpaper=$(find $WALLPAPER_DIR -maxdepth 1 -type f | shuf -n1 | sed 's/(/\\\(/g' | sed 's/)/\\\)/g' | sed "s/'/\\\'/g")

while true; do
  find "$WALLPAPER_DIR" -maxdepth 1 -type f |
    shuf |
    while read -r img; do
      awww img -t none --resize fit "$img"
      sleep $INTERVAL
    done
done
