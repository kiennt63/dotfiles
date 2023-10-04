#!/bin/bash

OS=$1

sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt install -y papirus-icon-theme zsh kitty build-essential awesome xclip redshift lxappearance libevent-dev gnome-tweak-tool pavucontrol maim sysstat ripgrep

# install nodejs 20
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# install bashls
sudo npm i -g bash-language-server

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# for binary and font stuff
mkdir -p ~/.local/bin
mkdir -p ~/.config/fontconfig

# Make backup config
cp -r ~/.config ~/.config_old

ln -sf $HOME/dotfiles/fetches/bunnyfetch ~/.local/bin
ln -sf $HOME/dotfiles/binaries/exa ~/.local/bin
ln -sf $HOME/dotfiles/zsh/.zshrc ~
ln -sf $HOME/dotfiles/starship.toml ~/.config
ln -sf $HOME/dotfiles/kitty ~/.config
ln -sf $HOME/dotfiles/nvim ~/.config
ln -sf $HOME/dotfiles/tmux ~/.config
ln -sf $HOME/dotfiles/git/.gitconfig ~

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
    ln -sf $HOME/dotfiles/.Xresources ~

    ln -sf $HOME/dotfiles/binaries/pamixer ~/.local/bin
    # config font
    cp -r $HOME/dotfiles/fonts/* ~/.fonts
    fc-cache -f ~/.fonts
    ln -sf $HOME/dotfiles/fonts.conf ~/.config/fontconfig
    gsettings set org.gnome.desktop.interface monospace-font-name "Ligamononoki Nerd Font 11"
    fc-cache -fr
fi

echo "Running theme setup for nord by default, you can change via ~/dotfiles/set_theme.sh --help"
~/dotfiles/set_theme.sh nord
