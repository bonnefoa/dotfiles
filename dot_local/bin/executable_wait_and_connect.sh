#!/bin/bash
set -eu

check_key ()
{
    ykman list | grep -q 15497705
}

while ! check_key; do
    sleep 1
done

pkill autossh || true
autossh -M20000 -t arpi 'tmux -u a -d'; $SHELL
