. "$HOME/.cargo/env"
export EDITOR="vim"
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/cmake-3.27.6-linux-x86_64/bin:$PATH
export PATH=$HOME/go/bin:/usr/local/go/bin:$HOME/ins/go/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

if [ -n "$TMUX" ]; then
    export TERM="tmux-256color"
else
    export TERM="xterm-256color"
fi
