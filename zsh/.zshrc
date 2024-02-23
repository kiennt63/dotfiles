# General options, history and completion related
source $HOME/dotfiles/zsh/options.sh

# Plugins
source $HOME/dotfiles/zsh/plugins.sh

# Key Binding
source $HOME/dotfiles/zsh/keybinding.sh

# ALIAS
source $HOME/dotfiles/zsh/alias.sh

# 3rdparty CLI setup
source $HOME/dotfiles/zsh/3rdparty.sh

# FZF SETUP
source $HOME/dotfiles/zsh/fzf.sh

# Theming
source $HOME/dotfiles/zsh/theme.sh

eval "$(zoxide init zsh)"

# Cute fetch on start-up
# bunnyfetch
pokemon-colorscripts --random --no-title
