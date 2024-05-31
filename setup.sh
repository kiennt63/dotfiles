#!/bin/bash

OS=$1

# normal universial stuff
sudo apt install -y  zsh kitty build-essential awesome xclip redshift libevent-dev pavucontrol maim sysstat ripgrep bat fd-find qalc gpaste xdotool

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | zsh

# wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install -y wezterm

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | zsh

# install go and sesh

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
ln -sf $HOME/dotfiles/sesh ~/.config

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
    ln -sf $HOME/dotfiles/.gtkrc-2.0 ~/.gtkrc-2.0
    ln -sf $HOME/dotfiles/.Xresources ~/.Xresources

    ln -sf $HOME/dotfiles/binaries/pamixer ~/.local/bin/pamixer
    ln -sf $HOME/dotfiles/rofi/binaries/rofi-power-menu ~/.local/bin/rofi-power-menu
    ln -sf $HOME/dotfiles/rofi/binaries/rofi-gpaste ~/.local/bin/rofi-gpaste
    ln -sf /usr/bin/batcat ~/.local/bin/cat
    sh $HOME/dotfiles/prerequisites/keyd_setup.sh
    sudo mkdir -p /etc/keyd
    sudo cp $HOME/dotfiles/keyd/default.conf /etc/keyd
    sh $HOME/dotfiles/prerequisites/font_setup.sh
fi

echo "Running theme setup for nord by default, you can change via ~/dotfiles/set_theme.sh --help"
~/dotfiles/set_theme.sh nord
