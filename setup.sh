#!/bin/bash

OS=$1

sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt install -y papirus-icon-theme zsh kitty build-essential awesome xclip redshift lxappearance gnome-tweak-tool tmux pavucontrol maim

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
npm i -g bash-language-server

mkdir -p ~/.local/bin
mkdir -p ~/.config/fontconfig

# Make backup config
cp -r ~/.config ~/.config_old
#
# Clone zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/fzf-tab
git clone https://github.com/agkozak/zsh-z $HOME/dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-z


ln -sf $HOME/dotfiles/fetches/bunnyfetch ~/.local/bin
ln -sf $HOME/dotfiles/binaries/exa ~/.local/bin
ln -sf $HOME/dotfiles/zsh/.zshrc ~
ln -sf $HOME/dotfiles/starship.toml ~/.config
ln -sf $HOME/dotfiles/kitty ~/.config
ln -sf $HOME/dotfiles/nvim ~/.config

if [[ "$OS" = "linux" ]]; then
    echo "Setting up for linux"
    mkdir -p ~/.icons
    mkdir -p ~/.themes
    cp -ra $HOME/dotfiles/gnome/icons/* ~/.icons
    cp -ra $HOME/dotfiles/gnome/themes/* ~/.themes

    ln -sf $HOME/dotfiles/awesome ~/.config
    ln -sf $HOME/dotfiles/dunts ~/.config
    ln -sf $HOME/dotfiles/picom ~/.config
    ln -sf $HOME/dotfiles/ranger ~/.config
    ln -sf $HOME/dotfiles/rofi ~/.config
    ln -sf $HOME/dotfiles/binaries/nvim.appimage ~/.local/bin/vim
    ln -sf $HOME/dotfiles/.gtkrc-2.0 ~
    ln -sf $HOME/dotfiles/.gtkrc-2.0.mine ~

    ln -sf $HOME/dotfiles/binaries/pamixer ~/.local/bin
    # config font
    cp -r $HOME/dotfiles/fonts/* ~/.fonts
    fc-cache -f ~/.fonts
    ln -sf $HOME/dotfiles/fonts.conf ~/.config/fontconfig
    gsettings set org.gnome.desktop.interface monospace-font-name "Mononoki 11"
    fc-cache -fr
fi


echo "DONE SETUP DOTFILES"
echo "PLEASE CHECK IF THINGS IF WORKING PROPERLY AND REMOVE THE OLD CONFIG"
echo "Please install fzf manually using git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
