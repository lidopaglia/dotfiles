#!/bin/sh

# Use neovim if present
[ -x "$(command -v nvim)" ] && \
    alias vi='nvim' && \
    alias vim='nvim' vimdiff='nvim -d'

# Use $XINITRC variable if file exists
[ -f "$XINITRC" ] && alias startx='startx $XINITRC'

# shortcuts
alias d='docker'
alias g='git'
alias p='podman'
alias e='$EDITOR'
alias v='vim'

# exa
alias exa='exa --group-directories-first'
alias et='exa --tree --icons'

# ls
alias ls='LC_ALL=C.UTF-8 ls -Fh --color=auto --group-directories-first'
alias l='ls -l'
alias la='ls -A'
alias ll='ls -al'
alias lt='\ls -ltFh --color=auto'
alias lta='\ls -AltFh --color=auto'
alias ltr='\ls -ltrFh --color=auto'
alias ltra='\ls -AltrFh --color=auto'

alias lsd='lsd -l --group-dirs first'

# verbose & defaults
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

# podman
alias pils='podman images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}"'
alias pcls='podman container ls --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}" -a | tail -n +2 | sort -k1 -h'
alias psa='podman stop $(podman ps -q)'
alias pcu='podman compose up -d --force-recreate'
alias pcd='podman compose down'
alias pcp='podman compose pull'

# docker
alias dstop='docker stop $(docker ps -q)'
alias dtail="docker logs -tf --tail=50"
alias dils='docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}"'
alias dcls='docker container ls --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}" -a | tail -n +2 | sort -k1 -h'
alias dcu='docker compose up -d --force-recreate'
alias dcd='docker compose down'
alias dcp='docker compose pull'
alias dip='docker image prune'
alias dps='docker_ps_format'
alias dsp='docker system prune --all'
alias dcrm='docker container rm $(docker container ls -aq)'
alias drun='docker run --detach --rm'

# A more descriptive, yet concise lsblk.
alias lsblkid='lsblk -o name,label,fstype,size,uuid --noheadings'
# journalctl(1) - display anything from 'emerg' to 'warning' since boot.
alias jbp='journalctl -b -p 0..4 --no-pager'
# show errors with catalog text for the current boot
alias jrnl='journalctl -p 3 -xb'
# list users
alias userlist="cut -d: -f1 /etc/passwd"
# list microcode vulns
# http://kroah.com/log/blog/2018/01/19/meltdown-status-2/
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# tmux
# 't' is mapped to t-smart-tmux-session-manager
 alias                                               \
   ta="tmux attach"                                  \
   tls="tmux ls"                                     \

# yt-dlp
alias yt="yt-dlp --embed-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias ytt="yt --skip-download --write-thumbnail"
alias ytp="yt-dlp --embed-metadata -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias ytmp="ytp -x --audio-format mp3 --audio-quality 0"
alias ytm="yt-dlp --embed-metadata -i -x --audio-format mp3 --audio-quality 0 -o '%(album)s/%(playlist_index)s - %(title)s.%(ext)s'"

# jekyll/bundler
alias bej='bundle exec jekyll'
alias bejs='bej serve --livereload'
alias bejp='bej post'
alias bejd='bej draft'
alias bpub='bej publish'
alias bi='bundle install'
alias bu='bundle update'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cava="TERM=rxvt-unicode-256color cava"
