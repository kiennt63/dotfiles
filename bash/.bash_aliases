# navigation
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git
alias gc="git checkout"
alias gst="git status"
alias gw="git worktree"
alias gf="git fetch"
alias g="git"
alias lg="lazygit"

# save rm
alias rm="rm -i"

# grep
alias grep="grep --color=always"

# tmux
alias ts="tmux new -s"
alias ta="tmux attach"
alias tl="tmux ls"
alias tksv="tmux kill-server"
alias tn='tmux new -s $(pwd | sed "s/.*\/\.\?//g")'
alias t="sesh connect"

# conda
alias ca="conda activate"

# file management
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# exa
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first"
alias l="exa -l --icons --group-directories-first -a"
alias la="exa -l --icons --group-directories-first -a"
alias tree="exa --icons -T -L"

alias c="xclip -selection clipboard"
alias untar="tar -xvf"
alias feh="feh -xdZ -B #2E3440"
