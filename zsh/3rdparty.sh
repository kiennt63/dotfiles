if [ -f /opt/ros/melodic/setup.zsh ]; then
    source /opt/ros/melodic/setup.zsh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:$HOME/miniconda3/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
