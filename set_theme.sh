#!/bin/bash

THEME=$1
if [[ $THEME = "catppuccin" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/catppuccin.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/catppuccin.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/themes/frappe.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/catppuccin.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
elif [[ $THEME = "cat_mocha" ]]; then
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/themes/cat_mocha.lua" "$HOME/dotfiles/nvim/lua/plugins/themes/init.lua"
    sudo ln -sf "$HOME/dotfiles/awesome/theme/cat_mocha.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    sudo ln -sf "$HOME/dotfiles/kitty/themes/mocha.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/mocha.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
elif [[ $THEME = "nord" ]]; then
    # neovim
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/nord.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    sudo ln -sf "$HOME/dotfiles/awesome/theme/nord.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    sudo ln -sf "$HOME/dotfiles/kitty/themes/nord.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    sudo ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    sudo ln -sf "$HOME/dotfiles/tmux/themes/src/nord.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    sudo ln -sf "$HOME/dotfiles/dunst/nord" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    sudo ln -sf "$HOME/dotfiles/zsh/fzf/nord.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    sudo ln -sf "$HOME/dotfiles/rofi/themes/nord.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"
elif [[ $THEME = "gruvbox" ]]; then
    # neovim
    sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    sudo ln -sf "$HOME/dotfiles/awesome/theme/gruvbox.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    sudo ln -sf "$HOME/dotfiles/kitty/themes/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/gruvbox.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    # gitconfig
    sudo ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    sudo ln -sf "$HOME/dotfiles/tmux/themes/src/gruvbox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    sudo ln -sf "$HOME/dotfiles/dunst/gruvbox" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    sudo ln -sf "$HOME/dotfiles/zsh/fzf/gruvbox.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    sudo ln -sf "$HOME/dotfiles/rofi/themes/gruvbox.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"

    # sudo ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/theme.lua"
    # sudo ln -sf "$HOME/dotfiles/awesome/theme/gruvbox-material.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    # sudo ln -sf "$HOME/dotfiles/kitty/themes/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # sudo ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # sudo ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    # sudo ln -sf "$HOME/dotfiles/tmux/themes/src/gruvbox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
else
    echo "Choosen theme not supported. Currently support"
    echo "1. nord"
    echo "2. gruvbox"
fi
