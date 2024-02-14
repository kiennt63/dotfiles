# autoload -U compinit && compinit

setopt autocd
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# history
history() {( fc -Dlim "*$@*" 1 )}


zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
