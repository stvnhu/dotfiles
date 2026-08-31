#!/usr/bin/bash

# Check if shell is interactive
case $- in
*i*) ;;
*) return ;;
esac

# Shell options
shopt -s histappend

# Environment variables
HISTSIZE=10000
HISTFILESIZE=10000
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse --cycle --bind tab:down,shift-tab:up'

# Plugins
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Prompt
get_git_branch() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
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
fzf_history_sync() {
    history -c
    history -r
    __fzf_history__
}
bind -x '"\C-r": fzf_history_sync'

# Aliases
alias ls='ls --color'
alias grep='grep --color'

# Shell scripts
source ~/bin/bookmark.sh
