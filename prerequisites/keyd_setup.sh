#!/bin/bash

mkdir -p ~/ins
cd ~/ins
git clone https://github.com/rvaiya/keyd
cd keyd
make
sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
sudo apt install python-xlib
sudo apt install python3-xlib

ln -sf $HOME/dotfiles/keyd ~/.config

sudo usermod -aG keyd $(whoami)
