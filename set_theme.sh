#!/bin/bash

THEME=$1
if [[ $THEME = "catppuccin" ]]; then
    echo "Changing the theme to CATPPUCCIN"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/catppuccin.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    ln -sf "$HOME/dotfiles/awesome/theme/catppuccin.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    ln -sf "$HOME/dotfiles/kitty/themes/mocha.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/catppuccin.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/catppuccin.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    ln -sf "$HOME/dotfiles/dunst/nord" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/catppuccin.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    ln -sf "$HOME/dotfiles/rofi/themes/catppuccin.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"
    # gnome theme and stuff
    sed -i 's/gtk-theme-name=.*/gtk-theme-name=Catppuccin-Mocha-Standard-Lavender-Dark/g' "$HOME/dotfiles/gnome/gtk-3.0/settings.ini" 
    sed -i 's/gtk-theme-name=.*/gtk-theme-name="Catppuccin-Mocha-Standard-Lavender-Dark/g' "$HOME/dotfiles/gnome/.gtkrc-2.0"
    # starship
    sed -i "s/palette =.*/palette = 'catppuccin'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i "s/color_scheme =.*/color_scheme = 'Catppuccin Mocha'/g" "$HOME/dotfiles/.wezterm.lua"
elif [[ $THEME = "nord" ]]; then
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/nord.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    ln -sf "$HOME/dotfiles/awesome/theme/nord.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    ln -sf "$HOME/dotfiles/kitty/themes/nord.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/nord.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    ln -sf "$HOME/dotfiles/dunst/nord" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/nord.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    ln -sf "$HOME/dotfiles/rofi/themes/nord.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"
    # gnome theme and stuff
    sed -i 's/gtk-theme-name=.*/gtk-theme-name=Nordic-darker-v40/g' "$HOME/dotfiles/gnome/gtk-3.0/settings.ini" 
    sed -i 's/gtk-theme-name=.*/gtk-theme-name="Nordic-darker-v40"/g' "$HOME/dotfiles/gnome/.gtkrc-2.0"
    # starship
    sed -i "s/palette =.*/palette = 'nord'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i "s/color_scheme =.*/color_scheme = 'nord'/g" "$HOME/dotfiles/.wezterm.lua"
elif [[ $THEME = "nordfox" ]]; then
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/nordfox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    ln -sf "$HOME/dotfiles/awesome/theme/nordfox.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    ln -sf "$HOME/dotfiles/kitty/themes/nord.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/nordfox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    ln -sf "$HOME/dotfiles/dunst/nord" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/nord.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    ln -sf "$HOME/dotfiles/rofi/themes/nord.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"
    # gnome theme and stuff
    sed -i 's/gtk-theme-name=.*/gtk-theme-name=Nordic-darker-v40/g' "$HOME/dotfiles/gnome/gtk-3.0/settings.ini" 
    sed -i 's/gtk-theme-name=.*/gtk-theme-name="Nordic-darker-v40"/g' "$HOME/dotfiles/gnome/.gtkrc-2.0"
    # starship
    sed -i "s/palette =.*/palette = 'nordfox'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i "s/color_scheme =.*/color_scheme = 'nordfox'/g" "$HOME/dotfiles/.wezterm.lua"
elif [[ $THEME = "gruvbox" ]]; then
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # awesomewm
    ln -sf "$HOME/dotfiles/awesome/theme/gruvbox.lua" "$HOME/dotfiles/awesome/theme/palette.lua"
    # kitty
    ln -sf "$HOME/dotfiles/kitty/themes/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/gruvbox.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    # gitconfig
    ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/gruvbox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # dunst
    ln -sf "$HOME/dotfiles/dunst/gruvbox" "$HOME/dotfiles/dunst/dunstrc"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/gruvbox.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # rofi
    ln -sf "$HOME/dotfiles/rofi/themes/gruvbox.rasi" "$HOME/dotfiles/rofi/themes/palette.rasi"
    # gnome theme and stuff
    sed -i 's/gtk-theme-name=.*/gtk-theme-name=Gruvbox-Dark-BL/g' "$HOME/dotfiles/gnome/gtk-3.0/settings.ini" 
    sed -i 's/gtk-theme-name=.*/gtk-theme-name="Gruvbox-Dark-BL/g' "$HOME/dotfiles/gnome/.gtkrc-2.0"
    # starship
    sed -i "s/palette =.*/palette = 'gruvbox'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i "s/color_scheme =.*/color_scheme = 'Gruvbox Material (Gogh)'/g" "$HOME/dotfiles/.wezterm.lua"

    # ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/theme.lua"
    # ln -sf "$HOME/dotfiles/awesome/theme/gruvbox-material.lua" "$HOME/dotfiles/awesome/theme/theme.lua"
    # ln -sf "$HOME/dotfiles/kitty/themes/gruvbox-material-dark-medium.conf" "$HOME/dotfiles/kitty/themes/theme.conf"
    # ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    # ln -sf "$HOME/dotfiles/tmux/themes/src/gruvbox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
else
    echo "Choosen theme not supported. Currently support"
    echo "1. nord"
    echo "2. gruvbox"
fi
