export ZSH="$HOME/.oh-my-zsh"
# ----------------- Ignore history ---------------
HISTORY_IGNORE="(ls|pwd|clear)"

DISABLE_MAGIC_FUNCTIONS="true"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
# ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
# ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
# ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=1'



plugins=(git fzf-tab tmux web-search zsh-z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

