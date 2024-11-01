#!/bin/sh

# Use neovim if present
[ -x "$(command -v nvim)" ] && alias vi='nvim' vim='nvim' vimdiff='nvim -d'

# shortcuts
alias e='$EDITOR'
alias g='git'
alias v='vim'

# ls
alias ls='LC_ALL=C.UTF-8 ls -Fh --color=auto --group-directories-first'
alias l='ls -l'
alias la='ls -A'
alias ll='ls -al'
alias lt='\ls -ltFh --color=auto'
alias lta='\ls -AltFh --color=auto'
alias ltr='\ls -ltrFh --color=auto'
alias ltra='\ls -AltrFh --color=auto'

# verbose & defaults
alias exa='exa --group-directories-first'
alias et='exa --tree --icons'
alias lsd='lsd -l --group-dirs first'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias mkdir='mkdir -pv'
alias bc='bc -ql'
alias ffmpeg="ffmpeg -hide_banner"
alias df='df -h -x tmpfs -x devtmpfs'
alias dir='du -sh */ | sort -h'
alias free='free -h'
alias rg="rg --sort path"
alias tree='tree -aChN --dirsfirst -I .git'
alias rename='rename -v'
alias ip='ip -c'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ccat='highlight --out-format=ansi'
alias cava="TERM=rxvt-unicode-256color cava"
alias lsblk='lsblk -o name,fstype,size,type,uuid'

# docker
alias dstop='docker stop $(docker ps -q)'
alias dtail="docker logs -tf --tail=50"
alias dils='docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}"'
alias dcls='docker container ls --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}" -a | tail -n +2 | sort -k1 -h'
alias dip='docker image prune'
alias dps='docker_ps_format'
alias dsp='docker system prune --all'
alias dcrm='docker container rm $(docker container ls -aq)'
alias drun='docker run --detach --rm'

# docker compose
alias dcu='docker compose up -d --force-recreate'
alias dcd='docker compose down'
alias dcp='docker compose pull'

# journalctl(1)
# display anything from 'emerg' to 'warning' since boot.
alias jbp='journalctl -b -p 0..4 --no-pager'
# show errors with catalog text for the current boot
alias jrnl='journalctl -p 3 -xb'

# list users
alias userls="cut -d: -f1 /etc/passwd"

# list microcode vulns
# http://kroah.com/log/blog/2018/01/19/meltdown-status-2/
alias ucode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# tmux
# 't' is mapped to t-smart-tmux-session-manager
alias ta="tmux attach" tls="tmux ls"

# yt-dlp
alias yt="yt-dlp --embed-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias ytt="yt --skip-download --write-thumbnail"
alias ytp="yt-dlp --embed-metadata -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias ytmp="ytp -x --audio-format mp3 --audio-quality 0"
alias ytm="yt-dlp --embed-metadata -i -x --audio-format mp3 --audio-quality 0 -o '%(album)s/%(playlist_index)s - %(title)s.%(ext)s'"
