# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source $HOME/dotfiles/zsh/fzf/init.sh

# Prompt
source $HOME/dotfiles/zsh/theme.sh

eval "$(zoxide init zsh)"

# Cute fetch on start-up
# pokemon-colorscripts --random --no-title

# export NVM_DIR=$HOME/.nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
