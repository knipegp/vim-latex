#!/bin/bash
if [ ! -d "$1" ]; then
    echo "$1 is not an existing directory"
    exit 1
fi
HOST_DIR="$1"
USER_ID="$(id -u)"

HOME_DIR="/home/developer"

docker run -it --rm --user="$USER_ID" --mount type=bind,source="$HOST_DIR",target="$HOME_DIR/project" -w "$HOME_DIR/project" vim-latex /bin/bash
