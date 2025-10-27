# ~/.bashrc

# Only run for interactive shells
[[ $- != *i* ]] && return

# Start X if needed
if [[ -z "$DISPLAY" && $(tty) =~ ^/dev/tty[1-6]$ ]]; then
    clear
    cat <<"EOF"

  ███████╗████████╗ █████╗ ██████╗ ████████╗    ██████╗ ██╗    ██╗███╗   ███╗██████╗ 
  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝    ██╔══██╗██║    ██║████╗ ████║╚════██╗
  ███████╗   ██║   ███████║██████╔╝   ██║       ██║  ██║██║ █╗ ██║██╔████╔██║  ▄███╔╝
  ╚════██║   ██║   ██╔══██║██╔══██╗   ██║       ██║  ██║██║███╗██║██║╚██╔╝██║  ▀▀══╝ 
  ███████║   ██║   ██║  ██║██║  ██║   ██║       ██████╔╝╚███╔███╔╝██║ ╚═╝ ██║  ██╗   
  ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═════╝  ╚══╝╚══╝ ╚═╝     ╚═╝  ╚═╝
  EOF
    read -p "[Y/n] " answer
    answer=${answer:-Y} # default to Yes if enter
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        startx
    else
        clear
        cat <<"EOF"

  ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ████████╗ ██████╗     ██╗   ██╗ ██████╗ ██╗██████╗ ██╗
  ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔═══██╗    ██║   ██║██╔═══██╗██║██╔══██╗██║
  ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗         ██║   ██║   ██║    ██║   ██║██║   ██║██║██║  ██║██║
  ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝         ██║   ██║   ██║    ╚██╗ ██╔╝██║   ██║██║██║  ██║╚═╝
  ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗       ██║   ╚██████╔╝     ╚████╔╝ ╚██████╔╝██║██████╔╝██╗
   ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝       ╚═╝    ╚═════╝       ╚═══╝   ╚═════╝ ╚═╝╚═════╝ ╚═╝
   EOF
        fastfetch
    fi
fi

# Default values
sudo mkdir -p /run/user/$(id -u)
sudo chown $(id -u):$(id -g) /run/user/$(id -u)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export EDITOR=nvim
export VISUAL=nvim

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
PS1="[\u${GREEN}@${RESET}\h] ${CYAN}\W ${GREEN}\$(git_branch)${GREEN} >> ${RESET}"