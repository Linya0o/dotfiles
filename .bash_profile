#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start tmux on login shell
if [ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 4>&1
fi
