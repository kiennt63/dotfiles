setopt EXTENDED_HISTORY
setopt autocd

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# history
history() {( fc -Dlim "*$@*" 1 )}


source $HOME/dotfiles/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source $HOME/dotfiles/zsh/plugins/fzf-tab/fzf-tab.zsh
source $HOME/dotfiles/zsh/plugins/zsh-autosuggestions.zsh
source $HOME/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
