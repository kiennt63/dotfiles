#!/bin/bash

TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Usage: ./add.sh <thing/to/add>"
    exit 0
fi

TARGET_NAME="$(basename $TARGET)"
# echo $TARGET_NAME
# echo $TARGET
if [[ -f $TARGET || -d $TARGET ]]; then
    mv $TARGET ~/dotfiles
fi

ln -s "$(realpath ~/dotfiles/$TARGET_NAME)" "$TARGET"




