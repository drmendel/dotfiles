# .zshrc

# Export variables
export TERM=alacritty
export COLORTERM=truecolor
export LS_COLORS="di=38;5;110:ln=38;5;218:so=38;5;79:pi=38;5;229:ex=38;5;114:bd=38;5;238:cd=38;5;238:su=38;5;210:sg=38;5;210:tw=38;5;229:ow=38;5;229:fi=38;5;252:or=38;5;210:*.tar=38;5;229:*.zip=38;5;229:*.gz=38;5;229:*.bz2=38;5;229:*.png=38;5;79:*.jpg=38;5;79:*.jpeg=38;5;79:*.gif=38;5;79:*.svg=38;5;79:*.sh=38;5;114:*.py=38;5;114:*.rb=38;5;114:*.pl=38;5;114:*.md=38;5;252:*.txt=38;5;252"

# Key bindings
bindkey "\e[3~" delete-char

# Aliases
alias ls='ls --color=always'
alias ll='ls -al --color=always'
alias lscolors='for i in {0..255}; do printf "\x1b[38;5;${i}m%3d " $i; ((i%16==15)) && echo; done; echo -e "\x1b[0m"'
alias freecad='FreeCAD'

# Starship configuration
eval "$(starship init zsh)"
