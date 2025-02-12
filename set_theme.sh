#!/bin/bash

THEME=$1
if [[ $THEME = "catppuccin" ]]; then
    echo "Changing the theme to CATPPUCCIN"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/catppuccin.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/catppuccin.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/catppuccin.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/catppuccin.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # sketchybar
    ln -sf "$HOME/dotfiles/sketchybar/schemes/catppuccin.sh" "$HOME/dotfiles/sketchybar/schemes/palette.sh"
    # starship
    sed -i '' "s/palette =.*/palette = 'catppuccin'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i '' "s/color_scheme =.*/color_scheme = 'Catppuccin Mocha'/g" "$HOME/dotfiles/.wezterm.lua"
    # ghostty
    sed -i '' "s/theme =.*/theme = catppuccin-mocha/g" "$HOME/dotfiles/ghostty/config"
    # aerospace border
    sed -i '' "s/ active_color=[^ ]* [^ ]*/ active_color=0xaa89b4fa inactive_color=0x77313244/g" "$HOME/dotfiles/aerospace/.aerospace.toml"
elif [[ $THEME = "nord" ]]; then
    echo "Changing the theme to NORD"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/nord.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/nord.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/nord.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/nord.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/nord.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # sketchybar
    ln -sf "$HOME/dotfiles/sketchybar/schemes/nord.sh" "$HOME/dotfiles/sketchybar/schemes/palette.sh"
    # starship
    sed -i '' "s/palette =.*/palette = 'nord'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i '' "s/color_scheme =.*/color_scheme = 'nord'/g" "$HOME/dotfiles/.wezterm.lua"
    # ghostty
    sed -i '' "s/theme =.*/theme = nordfox/g" "$HOME/dotfiles/ghostty/config"
    # aerospace border
    sed -i '' "s/ active_color=[^ ]* [^ ]*/ active_color=0xaa81a1c1 inactive_color=0x773b4252/g" "$HOME/dotfiles/aerospace/.aerospace.toml"
elif [[ $THEME = "gruvbox" ]]; then
    echo "Changing the theme to GRUVBOX"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/gruvbox.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/gruvbox.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/gruvbox.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/gruvbox.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # sketchybar
    ln -sf "$HOME/dotfiles/sketchybar/schemes/gruvbox.sh" "$HOME/dotfiles/sketchybar/schemes/palette.sh"
    # starship
    sed -i '' "s/palette =.*/palette = 'gruvbox'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i '' "s/color_scheme =.*/color_scheme = 'Gruvbox Material (Medium)'/g" "$HOME/dotfiles/.wezterm.lua"
    # ghostty
    sed -i '' "s/theme =.*/theme = gruvbox-material-medium/g" "$HOME/dotfiles/ghostty/config"
    # aerospace border
    sed -i '' "s/ active_color=[^ ]* [^ ]*/ active_color=0xaad4be98 inactive_color=0x7732302f/g" "$HOME/dotfiles/aerospace/.aerospace.toml"
elif [[ $THEME = "everforest" ]]; then
    echo "Changing the theme to **EVERFOREST**"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/everforest.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/everforest.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/everforest.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/everforest.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # sketchybar
    ln -sf "$HOME/dotfiles/sketchybar/schemes/everforest.sh" "$HOME/dotfiles/sketchybar/schemes/palette.sh"
    # starship
    sed -i '' "s/palette =.*/palette = 'everforest'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i '' "s/color_scheme =.*/color_scheme = 'everforest'/g" "$HOME/dotfiles/.wezterm.lua"
    # ghostty
    sed -i '' "s/theme =.*/theme = everforest/g" "$HOME/dotfiles/ghostty/config"
    # aerospace border
    sed -i '' "s/ active_color=[^ ]* [^ ]*/ active_color=0xaad3c6aa inactive_color=0x772e383c/g" "$HOME/dotfiles/aerospace/.aerospace.toml"
elif [[ $THEME = "kanagawa" ]]; then
    echo "Changing the theme to **KANAGAWA**"
    # neovim
    ln -sf "$HOME/dotfiles/nvim/lua/plugins/config/scheme/kanagawa.lua" "$HOME/dotfiles/nvim/lua/plugins/config/scheme/init.lua"
    # startpage
    ln -sf "$HOME/dotfiles/startpages/raichu_startpage/css/gruvbox.css" "$HOME/dotfiles/startpages/raichu_startpage/css/vars.css"
    #gitconfig
    ln -sf "$HOME/dotfiles/git/gruvbox.gitconfig" "$HOME/dotfiles/git/theme.gitconfig"
    # tmux
    ln -sf "$HOME/dotfiles/tmux/themes/src/kanagawa.conf" "$HOME/dotfiles/tmux/themes/src/palette.conf"
    # fzf
    ln -sf "$HOME/dotfiles/zsh/fzf/kanagawa.sh" "$HOME/dotfiles/zsh/fzf/init.sh"
    # sketchybar
    ln -sf "$HOME/dotfiles/sketchybar/schemes/gruvbox.sh" "$HOME/dotfiles/sketchybar/schemes/palette.sh"
    # starship
    sed -i '' "s/palette =.*/palette = 'everforest'/g" "$HOME/dotfiles/starship/starship.toml"
    # wezterm
    sed -i '' "s/color_scheme =.*/color_scheme = 'everforest'/g" "$HOME/dotfiles/.wezterm.lua"
    # ghostty
    sed -i '' "s/theme =.*/theme = Kanagawa Dragon/g" "$HOME/dotfiles/ghostty/config"
    # aerospace border
    sed -i '' "s/ active_color=[^ ]* [^ ]*/ active_color=0xaad3c6aa inactive_color=0x772e383c/g" "$HOME/dotfiles/aerospace/.aerospace.toml"
else
    echo "Choosen theme not supported. Currently support"
    echo "1. nord"
    echo "2. catppuccin"
    echo "3. gruvbox"
    echo "3. everforest"
fi
