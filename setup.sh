#!/bin/bash

OS=$1

mkdir -p ~/.local/bin

# Make backup config
cp -r ~/.config ~/.config_old
#
# Clone zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/fzf-tab
git clone https://github.com/agkozak/zsh-z $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-z


ln -sf $HOME/dotfiles/fetches/bunnyfetch ~/.local/bin
ln -sf $HOME/dotfiles/zsh/.zshrc ~
ln -sf $HOME/dotfiles/starship.toml ~/.config
ln -sf $HOME/dotfiles/kitty ~/.config
ln -sf $HOME/dotfiles/nvim ~/.config

if [[ "$OS" = "linux" ]]; then
    echo "Setting up for linux"
    ln -sf $HOME/dotfiles/awesome ~/.config
    ln -sf $HOME/dotfiles/dunts ~/.config
    ln -sf $HOME/dotfiles/picom ~/.config
    ln -sf $HOME/dotfiles/ranger ~/.config
    ln -sf $HOME/dotfiles/rofi ~/.config
fi

echo "DONE SETUP DOTFILES"
echo "PLEASE CHECK IF THINGS IF WORKING PROPERLY AND REMOVE THE OLD CONFIG"
