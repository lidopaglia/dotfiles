
# Use neovim for vim if present
[ -x "$(command -v nvim)" ] && \
  alias vim="nvim"    \
    vimdiff="nvim -d" \
    v='nvim'          \
    nv='nvim'         \

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

# git
alias gl="git --no-pager log --reverse --pretty=format:'%CredCommit %Cgreen%h%Cred pushed %ar by %Cgreen%an%Creset%Cred:%Creset%n\"%s\"%n' 2> /dev/null"
alias gss="git --no-pager show --pretty=format:'%CredCommit %Cgreen%h%Cred pushed %ar by %Cgreen%an%Creset%Cred:%Creset%n\"%s\"%n'"
alias gs='git status -s'

# tfl quality of life improvements
alias lsblkid='lsblk -o name,label,fstype,size,uuid --noheadings' #: A more descriptive, yet concise lsblk.
alias jbp='journalctl -b -p 0..4 --no-pager' #: Use journalctl(1) to display anything from 'emerg' to 'warning' since boot.

# colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ccat='highlight --out-format=ansi'

# be verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# defaults 
alias ffmpeg="ffmpeg -hide_banner"
alias df='df -h -x tmpfs -x devtmpfs'
alias tree='tree -aChN --dirsfirst -I .git'
alias dir='du -sh */ | sort -h'

# docker
alias dils='docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}"'
alias dcls='docker container ls --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}" -a | tail -n +2 | sort -k1 -h'
alias dsa='docker stop $(docker ps -q)'
alias dcu='docker compose up -d --force-recreate'
alias dcd='docker compose down'
