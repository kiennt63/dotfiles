#!/bin/bash

mkdir -p ~/.config/fontconfig

# config font
cp -r $HOME/dotfiles/fonts/* ~/.fonts
fc-cache -f ~/.fonts
ln -sf $HOME/dotfiles/fonts.conf ~/.config/fontconfig
gsettings set org.gnome.desktop.interface monospace-font-name "Ligamononoki Nerd Font 11"
fc-cache -fr
