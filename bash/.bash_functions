#!/bin/bash

# show me jump aliases
function j() {
  grep '^alias j.*' ~/.config/shell/aliasrc \
    | awk '{ FS="(alias )";print $2 }' \
    | tail -n +2 \
    | bat -l sh --style=grid,numbers
}

# tmux stuff
# ==========

function ta () {
    if [ -z "$1" ]; then
        tmux attach
    else
        tmux attach -t $1
    fi
}

function tk () { tmux kill-session -t $1; }
function tc () { tmux new -s $1; }

# ----------------------
# base16-shell colors
# fav colors:
#   - gruvbox-dark-pale
#   - material-palenight
#   - onedark
# ----------------------

# Set color scheme
function color () {
    export THEME=$1
    BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-$1.sh"
    source $BASE16_SHELL
}

# Set random color scheme
function rndcolor () {
    SELECTED=$(ls ~/.config/base16-shell/scripts/ | grep -v light | gshuf -n 1 | cut -d . -f 1 | awk -F "base16-" '{print $2}')
    color $SELECTED
    echo "Color scheme is $SELECTED"
}

# List available colors
function lscolor () {
    ls ~/.config/base16-shell/scripts/ | grep -v light
}

# Colorize man page output
function man() {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "$@"
}

# --------------------------------------------------------------
# l(ist)ips Get local and WAN IP adddresses
# Updated based on comments from Keith Rollin and Daniel Whicker
# http://brettterpstra.com/2017/10/30/a-few-new-shell-tricks/
# $ lips
#    Local IP: 10.0.1.4
# External IP: 41.32.11.102
# --------------------------------------------------------------
lips() {
  local interface ip
  for interface in $(networksetup -listallhardwareports | awk '/^Device: /{print $2}'); do
    ip=$(ipconfig getifaddr $interface)
    [ "$ip" != "" ] && break
  done

  local locip extip

  [ "$ip" != "" ] && locip=$ip || locip="inactive"

  ip=`dig +short myip.opendns.com @resolver1.opendns.com`
  [ "$ip" != "" ] && extip=$ip || extip="inactive"

  printf '%11s: %s\n%11s: %s\n' "loc" $locip "ext" $extip
}

# ----------------------------------------------------
# Find and Kill
# lets you do a quick search of your running processes
# for a case-insensitive partial match of the first 
# parameter passed to it.
# http://brettterpstra.com/2010/03/06/fk-redux/
# ----------------------------------------------------
fp () {
    # find and list processes matching a case-insensitive partial-match string
    ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () {
  # find and kill
  IFS=$'\n'
  PS3='Kill which process? (1 to cancel): '
  select OPT in "Cancel" $(fp $1); do
    if [ $OPT != "Cancel" ]; then
      kill $(echo $OPT|awk '{print $NF}')
    fi
    break
  done
  unset IFS
}

# docker stuff
# ============
function dps () {
    docker ps -a --format 'table {{ .ID }}\t{{.Names}}\t{{ .Status }}\t{{ .Image }}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}'
}

function pkglist () {
    dpkg -l | awk '/^ii/ {print($2)}'
}
