#!/bin/bash

maim -s -B --format png /dev/stdout | xclip -selection clipboard -t image/png -i
