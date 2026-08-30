#!/usr/bin/bash

# is shell interactive
case $- in
*i*) ;;
*) return ;;
esac

# shell options
shopt -s histappend

# environment variables
HISTSIZE=10000
HISTFILESIZE=10000
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse --cycle --bind tab:down,shift-tab:up'

# plugins
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# prompt
get_git_branch() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        echo -e "\001\033[1;31m\002(\001\033[1;34m\002$branch\001\033[1;31m\002)"
    fi
}
PS0='\[\033[0m\]'
PS1="\[\033[1;37m\][\[\033[1;32m\]\u\[\033[1;34m\]@\h \[\033[1;33m\]\w\$(get_git_branch)\[\033[1;37m\]]\$ "

# keybinds
bind 'set completion-ignore-case on'
bind 'Tab: menu-complete'
bind '"\e[Z": menu-complete-backward'
fzf_history_sync() {
    history -c
    history -r
    __fzf_history__
}
bind -x '"\C-r": fzf_history_sync'

# aliases
alias ls='ls --color'
alias grep='grep --color'

# scripts
source ~/bin/bookmark.sh
