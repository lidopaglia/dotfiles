#!/bin/bash

fpr() {
  # list and remove flatpak
  flatpak list --app --columns=application,name | \
    awk '{print $1 " ("substr($0, index($0, $2))")"}' | \
    fzf | \
    awk -F ' \\(|\\)' '{print $1}' | \
    xargs -r flatpak uninstall --noninteractive
}

fps() {
  # search for and install flatpak
  flatpak search $1 --columns=application,name | \
      awk '{print $1 " ("substr($0, index($0, $2))")"}' | \
      fzf | \
      awk -F ' \\(|\\)' '{print $1}' | \
      xargs -r flatpak install --noninteractive
}

# git show log - git commit browser
# https://gist.github.com/junegunn/f4fca918e937e6bf5bad
gsl() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# find-&-edit
fe() {
    check_progs fd fzf-tmux || return 1
    IFS=$'\n'
    files=$(fd -H . | fzf-tmux --query="$1" --multi --select-1 --exit-0)
    [ -n "$files" ] && ${EDITOR:-nvim} "${files[@]}"
}

# simple calculator
# https://github.com/jessfraz/dotfiles
calc() {
    local result=""
    result="$(printf "scale=10;%s\\n" "$*" | bc --mathlib | tr -d '\\\n')"
    #						└─ default (when `--mathlib` is used) is 20

    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        # add "0" for cases like ".5"
        # add "0" for cases like "-.5"
        # remove trailing zeros
        printf "%s" "$result" |
            sed -e 's/^\./0./'  \
            -e 's/^-\./-0./' \
            -e 's/0*$//;s/\.$//'
                else
                    printf "%s" "$result"
    fi
    printf "\\n"
}

# Truncate each line of the input to X characters
# flag -s STRING (optional): add STRING when truncated
# switch -l (optional): truncate from left instead of right
# param 1: (optional, default 70) length to truncate to
# https://brettterpstra.com/2016/04/27/shell-tricks-shorten-every-line-of-output/
shorten() {
    local helpstring ellip
    helpstring=$(
cat <<'EOF'
Truncate each line of the input to X characters
    -l          Shorten from left side
    -s STRING   Replace truncated characters with STRING

    $ ls | shorten -s ... 15
EOF
)
	ellip="" left=false
	OPTIND=1
	while getopts "hls:" opt; do
		case $opt in
			l) left=true ;;
			s) ellip=$OPTARG ;;
			h) echo -e "$helpstring"; return;;
			*) return 1;;
		esac
	done
	shift $((OPTIND-1))

	if $left; then
		cat | sed -E "s/.*(.{${1-70}})$/${ellip}\1/"
	else
		cat | sed -E "s/(.{${1-70}}).*$/\1${ellip}/"
	fi
}


showalias() {
  alias | sed 's/alias //' | fzf | eval "$(cut -d'=' -f1)"
}

which-term() {
  # basename because of apps like gnome-terminal and console (kgx)
  ps -o 'cmd=' -p "$(ps -o 'ppid=' -p $$|tr -d ' ')" | cut -d' ' -f1
}

# TODO remove?
#
# tmux
#ta() {
#    if [ -z "$1" ]; then
#        tmux attach
#    else
#        tmux attach -t "$1"
#    fi
#}
#
#tk() { tmux kill-session -t "$1"; }
#tc() { tmux new -s "$1"; }

# ----------------------
# base16-shell colors
# fav colors:
#   - gruvbox-dark-pale
#   - material-palenight
#   - onedark
# ----------------------

# Set color scheme
#function color () {
#    export THEME=$1
#    BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-$1.sh"
#    source $BASE16_SHELL
#}
#
## Set random color scheme
#function rndcolor () {
#    SELECTED=$(ls ~/.config/base16-shell/scripts/ | grep -v light | gshuf -n 1 | cut -d . -f 1 | awk -F "base16-" '{print $2}')
#    color $SELECTED
#    echo "Color scheme is $SELECTED"
#}
#
## List available colors
#function lscolor () {
#    ls ~/.config/base16-shell/scripts/ | grep -v light
#}

# colorize man pages
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


# ----------------------------------------------------
# Find and Kill
# lets you do a quick search of your running processes
# for a case-insensitive partial match of the first 
# parameter passed to it.
# http://brettterpstra.com/2010/03/06/fk-redux/
# ----------------------------------------------------
# find and list processes matching a case-insensitive partial-match string
find-process() {
  ps -Ao pid,comm\
    | awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}' \
    | grep -i "$1" \
    | grep -v grep
}

# find and kill
find-kill() {
  IFS=$'\n'
  PS3='Kill which process? (1 to cancel): '
  select OPT in "Cancel" $(find-process "$1"); do
    if [ "$OPT" != "Cancel" ]; then
      kill "$(echo "$OPT" | awk '{print $NF}')"
    fi
    break
  done
  unset IFS
}

check_progs() {
  for program in "$@"; do
    if ! command -v "$program" &> /dev/null; then
      echo "ERROR: '$program' is not installed."
      return 1
    fi
  done
}

# The version.bind TXT response is supported by a handful of common DNS
# implementations, including ISC BIND, and returns the name and version number
# of the service.
vbind(){
    check_progs dig || return 1
    dig version.bind txt chaos @"$1" +short +timeout=1 \
        | tr -d '"'
}

# get wan address via cloudflare dns
wan(){
  check_progs dig || return 1
  dig @1.1.1.1 whoami.cloudflare -c ch -t txt +short +timeout=1 \
    | tr -d '"'
}

# get ip things. omit loopback
gip(){
  case "$1" in
    down)
      ip -br -c -0 address | grep DOWN;;
    mac)
      ip -br -c -0 address | grep -v UNKNOWN;;
    4)
      ip -br -c -4 address | grep -v lo;;
    6)
      ip -br -c -6 address | grep -v lo;;
    *)
      ip -br -c address | grep -Ev 'lo|DOWN';;
  esac
}

# i think i wanted a list of all images specified in yaml currently broken.
# needs work. and the version of column across distros is not guaranteed to
# have the `-N` e.g. not available on Ubuntu 20.04
docker_rg_images() {
  check_progs rg || return 1
  path=${1:-.}
  #| cut -d':' -f1,3,4 --output-delimiter=" " \
  rg -i --glob '**/docker-compose.yml' --max-depth 2 --sort path -e 'image:' "$path" \
    | sed 's/://;s/image:/\t/' \
    | column -t -N FILE_PATH,IMAGE
}

docker_ps_format() {
  # drops the command, created, and ports columns.
  check_progs docker || return 1
  docker ps -a --format 'table {{ .ID }}\t{{.Names}}\t{{ .Status }}\t{{ .Image }}' \
    | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}'
}

docker_run_image() {
  # run an ad-hoc container
  docker run -dt -i $1
}

plist() {
  # TODO support more package managers/patforms
  dpkg -l \
    | awk '/^ii/ {a=$2;b=$5; for(i=6;i<=NF;i++){b=b" "$i};print a "\t" b}' \
    | column -ts $'\t' -N NAME,DESCRIPTION
}


# Add an "alert" alias for long running commands.
# sleep 10; alert
alert() {
  notify-send \
    "$([ $? = 0 ] && echo "command complete"|| echo "command error")" \
    "$(fc -l|tail -n1|awk '{$1="";split($0,a,";");print substr(a[1],2)}')"

clear-ls-all() {
  clear
  eza -al
}

clear-tree2() {
  clear
  tree -L 2
}

clear-tree3() {
  clear
  tree -L 3
}

clear-git-status() {
  clear
  git status
}

clear-fastfetch() {
  clear
  fastfetch
}

print-current-date() {
  printf $(date -I)
}

print-unix-timestamp() {
  printf $(date +%s)
}
