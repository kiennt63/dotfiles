HISTFILE=$HOME/dotfiles/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt autocd

source $HOME/dotfiles/zsh/plugins/zsh-z.plugin.zsh
source $HOME/dotfiles/zsh/plugins/fzf-tab/fzf-tab.zsh
source $HOME/dotfiles/zsh/plugins/zsh-autosuggestions.zsh
source $HOME/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
