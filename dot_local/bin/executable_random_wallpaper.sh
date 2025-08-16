#!/bin/bash
set -eu

WALLPAPER_DIR="$HOME/wallpaper/"

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION=fade
export SWWW_TRANSITION_DURATION=2
export SWWW_TRANSITION_STEP=220

# This controls (in seconds) when to switch to the next image
INTERVAL=${1:-300}

outputs=$(swww query | awk '{print $1}' | sed 's/://')
# wallpaper=$(find $WALLPAPER_DIR -maxdepth 1 -type f | shuf -n1 | sed 's/(/\\\(/g' | sed 's/)/\\\)/g' | sed "s/'/\\\'/g")

while true; do
  find "$WALLPAPER_DIR" -maxdepth 1 -type f |
    shuf |
    while read -r img; do
      swww img -t none --resize fit "$img"
      sleep $INTERVAL
    done
done
