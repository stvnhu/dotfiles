#!/usr/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell options
shopt -s histappend

# Environment variables
HISTSIZE=1024
HISTFILESIZE=1024
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse --cycle'
export PATH="$HOME/dotfiles/bash/bash_scripts/:$PATH"

# Plugins
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Prompt
get_git_branch() {
    local branch
    branch="$(git branch --show-current 2>/dev/null)"
    if [[ -n "$branch" ]]; then
        echo -e "\001\033[1;31m\002(\001\033[1;34m\002$branch\001\033[1;31m\002)"
    fi
}
PS0='\[\033[0m\]'
PS1="\[\033[1;37m\][\[\033[1;32m\]\u\[\033[1;34m\]@\h \[\033[1;33m\]\w\$(get_git_branch)\[\033[1;37m\]]\$ "

# Binds
bind 'set completion-ignore-case on'
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'
bind -r '\e\e'
__fzf_history_sync__() {
    history -c
    history -r
    __fzf_history__
}
bind -x '"\C-r": __fzf_history_sync__'

# Aliases
alias ls='ls --color'
alias grep='grep --color'
