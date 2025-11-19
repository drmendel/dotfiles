# Export variables

export EDITOR=nvim
export VISUAL=nvim

export TERM=alacritty
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

export COLORTERM=truecolor
export LS_COLORS="di=38;5;110:ln=38;5;218:so=38;5;79:pi=38;5;229:ex=38;5;114:bd=38;5;238:cd=38;5;238:su=38;5;210:sg=38;5;210:tw=38;5;229:ow=38;5;229:fi=38;5;252:or=38;5;210:*.tar=38;5;229:*.zip=38;5;229:*.gz=38;5;229:*.bz2=38;5;229:*.png=38;5;79:*.jpg=38;5;79:*.jpeg=38;5;79:*.gif=38;5;79:*.svg=38;5;79:*.sh=38;5;114:*.py=38;5;114:*.rb=38;5;114:*.pl=38;5;114:*.md=38;5;252:*.txt=38;5;252"


# Key bindings

bindkey "\e[3~" delete-char


# Aliases

alias ls='ls --color=always'
alias ll='ls -al --color=always'
alias lscolors='for i in {0..255}; do printf "\x1b[38;5;${i}m%3d " $i; ((i%16==15)) && echo; done; echo -e "\x1b[0m"'

alias fan_auto="sudo bash -c 'echo level auto > /proc/acpi/ibm/fan'"
alias fan_max="sudo bash -c 'echo level disengaged > /proc/acpi/ibm/fan'"
alias fan_0="sudo bash -c 'echo level 0 > /proc/acpi/ibm/fan'"
alias fan_1="sudo bash -c 'echo level 1 > /proc/acpi/ibm/fan'"
alias fan_2="sudo bash -c 'echo level 2 > /proc/acpi/ibm/fan'"
alias fan_3="sudo bash -c 'echo level 3 > /proc/acpi/ibm/fan'"
alias fan_4="sudo bash -c 'echo level 4 > /proc/acpi/ibm/fan'"
alias fan_5="sudo bash -c 'echo level 5 > /proc/acpi/ibm/fan'"
alias fan_6="sudo bash -c 'echo level 6 > /proc/acpi/ibm/fan'"
alias fan_7="sudo bash -c 'echo level 7 > /proc/acpi/ibm/fan'"

alias freecad='FreeCAD'


# NAS mounting functions

mnas() {
    if ! sudo -n true 2>/dev/null; then
        echo "Sudo required."
        sudo -v || { echo "Failed to get sudo privileges. Exiting."; return 1; }
    fi
    read "NAS_USER?Share username: "
    read -s "NAS_PASS?Share password: "
    sudo mkdir -p /mnt/nas || { echo "Failed to create /mnt/nas. Exiting."; return 1; }
    printf "\nMounting share to /mnt/nas/...\n"
    sudo mount -t cifs //192.168.0.252/nas /mnt/nas \
        -o username="$NAS_USER",password="$NAS_PASS",vers=3.0,uid=$UID,gid=$(id -g),_netdev
    if mountpoint -q /mnt/nas; then
        cd /mnt/nas || return
    fi
}

umnas() {
    if ! sudo -n true 2>/dev/null; then
        echo "Sudo required."
        sudo -v || { echo "Failed to get sudo privileges. Exiting."; return 1; }
    fi
    cd ~ || { echo "Cannot change to home directory. Exiting."; return 1; }
    if mountpoint -q /mnt/nas; then
        echo "Unmounting /mnt/nas/..."
        sudo umount /mnt/nas || { echo "Failed to unmount /mnt/nas/"; return 1; }
    fi
    if [[ -d /mnt/nas ]]; then
        sudo rmdir /mnt/nas || { echo "Failed to remove /mnt/nas."; return 1; }
    fi
}


# Starship configuration

eval "$(starship init zsh)"
