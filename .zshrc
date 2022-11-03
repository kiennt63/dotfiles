if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"
# ----------------- Ignore history ---------------
HISTORY_IGNORE="(ls|pwd|clear)"

# ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE="nerdfont-complete"
# ENABLE_CORRECTION="true"
DISABLE_MAGIC_FUNCTIONS="true"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=1'



plugins=(git fzf-tab tmux web-search zsh-z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ----------------- VI mode ---------------
bindkey -v
export KEYTIMEOUT=1

# ----------------- Key Binding -----------

bindkey '^[[13;5u' autosuggest-accept
bindkey '^[[13;2u' autosuggest-execute

# Change cursor shape for different vi modes.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.

# ----------------- 3rdparty setup --------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ----------------- ALIAS -----------------
source ~/.config/zsh/alias.sh

# ----------------- EXPORT -----------------
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/cmake/cmake-3.24.2-linux-x86_64/bin:$PATH
export PATH=/opt/ipg/bin/:$PATH
export PATH=/usr/src/tensorrt/bin/:$PATH
export PATH=/usr/local/cuda/bin/:$PATH
export CUDA_HOME=/usr/local/cuda
export ANDROID_NDK_HOME=$HOME/Android/Sdk/ndk/21.3.6528147
export ANDROID_NDK=$HOME/Android/Sdk/ndk/21.3.6528147
export NDK=$HOME/Android/Sdk/ndk/21.3.6528147
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/Downloads/installations/cudnn-10.2-linux-x64-v7.6.5.32/cuda/lib64/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/opencv/opencv-4.4.0/lib:$LD_LIBRARY_PATH

# ----------------- SOURCING -----------------
source /opt/ros/melodic/setup.zsh


# ----------------- FZF SETUP -----------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Catppuccin
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# Nord
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#4C566A,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Remove padding in the right end of the prompt
# ZLE_RPROMPT_INDENT=0
#
alias quanta="export ROS_IP=192.168.0.10; export ROS_MASTER_URI=http://192.168.0.10:11311"
alias ssh-quanta="ssh nvidia@192.168.0.10"

eval "$(starship init zsh)"
bunnyfetch
