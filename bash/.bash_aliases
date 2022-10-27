#!/bin/sh

# Use neovim for vim if present
[ -x "$(command -v nvim)" ] &&  \
  alias vim="nvim"              \
    vimdiff="nvim -d"           \
    v='nvim'                    \
    nv='nvim'                   \

# Use $XINITRC variable if file exists
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

# ls
alias ls='LC_ALL=C.UTF-8 ls -Fh --color=auto --group-directories-first'
alias lsa='ls -A'
alias l='ls -l'
alias la='ls -Al'
alias ll='ls -al'
alias lt='\ls -ltFh --color=auto'
alias lta='\ls -AltFh --color=auto'
alias ltr='\ls -ltrFh --color=auto'
alias ltra='\ls -AltrFh --color=auto'

alias lsd='lsd -l --group-dirs first'

# jump around
alias                                     \
  jb='pushd ~/.local/bin;clear'           \
  jc='pushd ~/.config;clear'              \
  jd='pushd ~/.dotfiles;clear'            \
  jm='pushd ~/media;clear'                \
  jmi='pushd ~/media/music/inbox;clear;'  \
  jpp='pushd ~/projects/personal;clear'   \
  jpw='pushd ~/projects/work;clear'       \

# git
alias gl="git --no-pager log --reverse --pretty=format:'%CredCommit %Cgreen%h%Cred pushed %ar by %Cgreen%an%Creset%Cred:%Creset%n\"%s\"%n' 2> /dev/null"
alias gss="git --no-pager show --pretty=format:'%CredCommit %Cgreen%h%Cred pushed %ar by %Cgreen%an%Creset%Cred:%Creset%n\"%s\"%n'"
alias gs='git status -s'

# be verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# defaults 
alias ffmpeg="ffmpeg -hide_banner"
alias df='df -h -x tmpfs -x devtmpfs'
alias dir='du -sh */ | sort -h'
alias free='free -h'
alias rg="rg --sort path"
alias tree='tree -aChN --dirsfirst -I .git'

# docker
alias dils='docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}"'
alias dcls='docker container ls --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}" -a | tail -n +2 | sort -k1 -h'
alias dsa='docker stop $(docker ps -q)'
alias dcu='docker compose up -d --force-recreate'
alias dcd='docker compose down'

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
alias                                               \
  tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"    \
  tt="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"         \
  tn="tmux new"                                     \
  ta="tmux attach"                                  \
  tls="tmux ls"                                     \

# colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ccat='highlight --out-format=ansi'

# bare git dotfiles
#alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#alias dots='dot status'
#alias dotls='dot ls-tree --full-tree -r --name-only HEAD'
#alias dotlsu='dot ls-files . --exclude-standard --others'

# yt-dlp
alias yt="yt-dlp --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias ytp="yt-dlp --add-metadata -i -o '%(playlist_index)s - %(title)s.%(ext)s'"
alias ytf="ytp --audio-format flac"
alias ytm="yt-dlp --add-metadata -i -x --audio-format mp3 --audio-quality 0 -o '%(album)s/%(playlist_index)s - %(title)s.%(ext)s'"

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
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

