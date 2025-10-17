# .bashrc

# Only run for interactive shells
[[ $- != *i* ]] && return

# Key bindings
bind '"\e[3~": delete-char' # DEL key

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias lscolors='for i in {0..255}; do printf "\x1b[38;5;${i}m%3d " $i; ((i%16==15)) && echo; done; echo -e "\x1b[0m"'

# Colors
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RESET="\[\033[0m\]"

# Git branch function
git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Prompt
PS1="\n,– \u${GREEN}@${RESET}\h ${CYAN}\W ${GREEN}\$(git_branch)${RESET}\n|\n$(echo $'\`')– ${GREEN} >> ${RESET}"