#!/bin/bash
set -eu

check_key ()
{
    ssh-add -l 2>/dev/null | grep -q sana
}

while ! check_key; do
    sleep 1
done

pkill autossh || true
autossh -M20000 -t pathos 'tmux a -d'; $SHELL
