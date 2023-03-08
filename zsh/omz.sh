export ZSH="$HOME/dotfiles/zsh/.oh-my-zsh"
# ----------------- Ignore history ---------------
HISTORY_IGNORE="(ls|pwd|clear)"

DISABLE_MAGIC_FUNCTIONS="true"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -A ZSH_HIGHLIGHT_STYLES

plugins=(git tmux fzf-tab web-search zsh-z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

