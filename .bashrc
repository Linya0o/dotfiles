#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=1000
HISTCONTROL=erasedups:ignoreboth
# HISTTIMEFORMAT='%F %T '
shopt -s histappend

# settings for fzf-tmux
export FZF_TMUX=1

# settings for fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --info=inline --border'
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_OPTS="--preview '(bat --style=numbers --color=always {} || cat {} || tree -C {}) 2> /dev/null | head -200'"

# completion for ubuntu
# [[ -f /usr/share/doc/fzf/examples/completion.bash ]] && . /usr/share/doc/fzf/examples/completion.bash
# [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && . /usr/share/doc/fzf/examples/key-bindings.bash

# completion for arch
[[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash
[[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/z/z.sh ]] && . /usr/share/z/z.sh

# fnm
# export PATH="/home/linya/.local/share/fnm:$PATH"
eval "`fnm env`"

alias vi='nvim'
alias ls='ls --color'
alias ll='ls -Ahl --color --sort=version --group-directories-first'
alias setproxy='export http_proxy=http://172.21.240.1:10809 https_proxy=http://172.21.240.1:10809'
alias unsetproxy='unset http_proxy https_proxy'
alias list="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# some useful function
function promptcommand {
    local exit_status=$?
    local number=$(history 1)
    number=${number%% *}
    if [ -n "$number" ]; then
        if [ $exit_status -eq 127 ] && ([ -z $HISTLASTENTRY ] || [ $HISTLASTENTRY -lt $number ]); then
            history -d $number
        else
            HISTLASTENTRY=$number
        fi
    fi
}
