#!/bin/bash

rofi -dpi 60 -show calc -modi calc -no-show-match -no-sort -calc-command "echo -n '{result}' | xclip -selection clipboard"
