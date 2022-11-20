#!/bin/bash

THEME=$1
if [[ $THEME = "catppuccin" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/catppuccin.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/catppuccin.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/frappe.conf" "$HOME/dotfiles/kitty/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/catppuccin.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
elif [[ $THEME = "cat_mocha" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/cat_mocha.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/cat_mocha.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/mocha.conf" "$HOME/dotfiles/kitty/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/mocha.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
elif [[ $THEME = "nord" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/nord.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/nord.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/nord.conf" "$HOME/dotfiles/kitty/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
elif [[ $THEME = "gruvbox" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/gruvbox.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
else
    echo "Choosen theme not supported. Currently support"
    echo "1. nord"
    echo "2. gruvbox"
fi
