#!/bin/bash

mkdir -p ~/.local/bin

# Make backup config
cp -ra ~/.config ~/.config_old

ln -sf $HOME/dotfiles/fetches/bunnyfetch ~/.local/bin
ln -sf $HOME/dotfiles/zsh/.zshrc ~
ln -sf $HOME/dotfiles/awesome ~/.config
ln -sf $HOME/dotfiles/dunts ~/.config
ln -sf $HOME/dotfiles/kitty ~/.config
ln -sf $HOME/dotfiles/nvim ~/.config
ln -sf $HOME/dotfiles/picom ~/.config
ln -sf $HOME/dotfiles/ranger ~/.config
ln -sf $HOME/dotfiles/rofi ~/.config
ln -sf $HOME/dotfiles/starship.toml ~/.config

echo "DONE SETUP DOTFILES"
echo "PLEASE CHECK IF THINGS IF WORKING PROPERLY AND REMOVE THE OLD CONFIG"
