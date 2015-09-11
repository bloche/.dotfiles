# git completion 
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
elif [ which -s brew && -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

export PS1="\[\e[0;36m\][\$PWD]\[\e[m\]\[\e[0;33m\]\$(__git_ps1)\[\e[m\]\n[\T]\[\e[0;32m\]\h\[\e[m\]$ "

if [ -f ~/.local_profile]; then
    source ~/.local_profile
fi

