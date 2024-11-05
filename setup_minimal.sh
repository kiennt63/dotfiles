#!/bin/bash

##### using bash shell plus minimal install of binaries

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# rustup and rust-built binaries
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

## yazi
cargo install --locked yazi-fm yazi-cli
## zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
## starship
cargo install starship --locked

# prebuilt binaries
ln -sf $HOME/dotfiles/binaries/exa ~/.local/bin

# bashrc
ln -sf $HOME/dotfiles/bash/.bashrc ~/.bashrc
ln -sf $HOME/dotfiles/bash/.bash_aliases ~/.bash_aliases

# zshrc
ln -sf $HOME/dotfiles/zsh/.zsh ~/.zshrc
ln -sf $HOME/dotfiles/zsh/.zshenv ~/.zshenv

# unload some config
mv ~/.config/tmux ~/.config/tmux.bak && ln -sf $HOME/dotfiles/tmux ~/.config/tmux
mv ~/.config/yazi ~/.config/yazi.bak && ln -sf $HOME/dotfiles/yazi ~/.config/yazi
mv ~/.config/starship.toml ~/.config/starship.toml && ln -sf $HOME/dotfiles/starship/starship.toml ~/.config/starship.toml
mv ~/.config/tmux ~/.config/tmux.bak && ln -sf $HOME/dotfiles/tmux ~/.config/tmux
mv ~/.config/tmux ~/.config/tmux.bak && ln -sf $HOME/dotfiles/tmux ~/.config/tmux

# install fonts
cp -ra $HOME/dotfiles/fonts/MapleMono-NF/* ~/.local/share/fonts
fc-cache -f -v

# miniforge3
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
