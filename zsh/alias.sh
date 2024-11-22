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

# dds
alias ddsbag="/opt/mpc/3rdparty/vinai_middleware/1.5.1/utilities/ddsbag/x64-linux/ddsbag"
alias ddstopic='f(){ (cd /opt/dds_utilities/ddstopic/x64-linux && ./ddstopic "$@");  unset -f f; }; f'

# save rm
alias rm="rm -i"

# grep
alias grep="grep --color=always"

# tmux 
alias ts="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tn='tmux new -s $(pwd | sed "s/.*\///g")'
alias t="sesh connect"

# file management
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# vim
alias v="vim"

# exa
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias l="eza -l --icons --group-directories-first -a"
alias la="eza -l --icons --group-directories-first -a"
alias tree="eza --icons -T -L"

alias untar="tar -xvf"
alias c="xclip -selection clipboard"
alias untar="tar -xvf"
alias wheel_speed="sh <(curl -s http://www.nicknorton.net/mousewheel.sh)"
alias feh="feh -xdZ -B #2E3440"
# alias source_adas="export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/adas/3rdparty/VinAI-ADAS-DDS-PRO/lib/x64Linux4gcc7.3.0:/opt/adas/3rdparty/RTI-DDS/rti_connext_dds-6.0.1/lib/x64Linux4gcc7.3.0; export PATH=/opt/VinAI-ADAS-DDS/VinAI-ADAS-DDS-1.0.18-20210717/vinai-adas-dds/utilities/ddsbag/bin/x64-linux:/opt/VinAI-ADAS-DDS/VinAI-ADAS-DDS-1.0.18-20210717/vinai-adas-dds/utilities/ddslaunch/bin/x64-linux:/opt/VinAI-ADAS-DDS/VinAI-ADAS-DDS-1.0.18-20210717/vinai-adas-dds/utilities/ddstopic/bin/x64-linux:$PATH"
alias zshrc="vim ~/.zshrc"
alias picomrc="vim ~/.config/picom/picom.conf"
alias kittyrc="vim ~/.config/kitty/kitty.conf"

alias ssh-xavier="ssh nvidia@10.111.194.199"
alias quanta="export ROS_IP=192.168.0.10; export ROS_MASTER_URI=http://192.168.0.10:11311"
alias ssh-quanta="ssh nvidia@192.168.0.10"

# conda env
alias ca="conda activate"
alias cde="conda deactivate"
