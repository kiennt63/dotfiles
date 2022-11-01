#!/bin/bash

THEME=$1
if [[ $THEME = "nord" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/nord.lua" "$HOME/dotfiles/nvim/lua/plugins/theme.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/nord.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/nord.conf" "$HOME/dotfiles/kitty/theme.conf"
elif [[ $THEME = "gruvbox" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/theme.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/gruvbox.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/theme.conf"
else
    echo "Choosen theme not supported. Currently support"
    echo "1. nord"
    echo "2. gruvbox"
fi


