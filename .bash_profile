# git completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

# set time between shell prompts for PS1
function timer_start {
  timer=${timer:-$SECONDS}
}
function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}
trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

export PS1="\[\e[0;36m\][\$PWD]\[\e[m\]\[\e[0;33m\]\$(__git_ps1)\[\e[m\]\n"'[${timer_show}s]'"\[\e[0;32m\]\h\[\e[m\]$ "

if [ -f ~/.local_profile ]; then
    source ~/.local_profile
fi

if [ -n "$(which docker-machine)" ]; then
    source .dotfiles/docker_alias.sh
fi
