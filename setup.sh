#!/bin/bash

OS=$1

sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt install -y papirus-icon-theme zsh kitty build-essential awesome xclip redshift lxappearance libevent-dev gnome-tweak-tool pavucontrol maim sysstat ripgrep bat fd-find

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

# Make backup config
cp -r ~/.config ~/.config_old

ln -sf $HOME/dotfiles/fetches/bunnyfetch ~/.local/bin
ln -sf $HOME/dotfiles/binaries/exa ~/.local/bin
ln -sf $HOME/dotfiles/zsh/.zshrc ~
ln -sf $HOME/dotfiles/zsh/.zshenv ~
ln -sf $HOME/dotfiles/zsh/.zsh_profile ~
ln -sf $HOME/dotfiles/starship/starship.toml ~/.config
ln -sf $HOME/dotfiles/kitty ~/.config
ln -sf $HOME/dotfiles/nvim ~/.config
ln -sf $HOME/dotfiles/tmux ~/.config
ln -sf $HOME/dotfiles/git/.gitconfig ~
ln -sf $HOME/dotfiles/lf ~/.config
ln -sf $HOME/dotfiles/yazi ~/.config

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
    ln -sf /usr/bin/batcat ~/.local/bin/cat
    sh $HOME/dotfiles/prerequisites/keyd_setup.sh
    sh $HOME/dotfiles/prerequisites/font_setup.sh
fi

echo "Running theme setup for nord by default, you can change via ~/dotfiles/set_theme.sh --help"
~/dotfiles/set_theme.sh nord
