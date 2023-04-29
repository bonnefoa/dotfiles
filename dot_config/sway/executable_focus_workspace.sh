#!/bin/bash

set -e

if [ $# -lt 1 ]; then
  echo Usage: "$0" WORKSPACE
  exit 1
fi

WORKSPACE="$1"

WORKSPACES_RAW=$(swaymsg -t get_workspaces --raw)
WORKSPACE_REPRESENTATION=$(echo "$WORKSPACES_RAW" | jq "map(select(.name | startswith(\"$WORKSPACE:\"))) | .[0].representation" -r)

if [[ "$WORKSPACE_REPRESENTATION" == "null" ]]; then
    # Non existent, create the workspace
    swaymsg workspace number "$WORKSPACE"
    exit 0
fi

WORKSPACE_OUTPUT=$(echo "$WORKSPACES_RAW" | jq "map(select(.name  | startswith(\"$WORKSPACE:\"))) | .[0].output" -r)
OUTPUT_RAWS=$(swaymsg -t get_outputs --raw)
FOCUSED_OUTPUT=$(echo "$OUTPUT_RAWS" | jq 'map(select(.focused == true)) | .[0].name' -r)
OTHER_OUTPUT=$(echo "$OUTPUT_RAWS" | jq 'map(select(.focused == false)) | .[0].name' -r)
if [[ "$FOCUSED_OUTPUT" == "$WORKSPACE_OUTPUT" ]]; then
    # We're in the correct output, focus on workspace
    swaymsg workspace number "$WORKSPACE"
else
    #if [[ "$OTHER_OUTPUT" != "null" ]]; then
        ## We want to swap, get workspace on the other output
        #OTHER_WORKSPACE=$(echo "$WORKSPACES_RAW" | jq "map(select(.visible == true and .output == \"$FOCUSED_OUTPUT\")) | .[0].num" -r)
        #swaymsg "[workspace=${OTHER_WORKSPACE}:]" move workspace to output "$OTHER_OUTPUT"
    #fi
    swaymsg "[workspace=${WORKSPACE}:]" move workspace to output "$FOCUSED_OUTPUT"
fi
