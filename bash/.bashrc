# ~/.bashrc
#
# Executed by bash(1) for interactive non-login shells.
# See: /usr/share/doc/bash/examples/startup-files

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# XDG Base Directory Definitions
# https://wiki.archlinux.org/title/XDG_Base_Directory
#
# XDG_RUNTIME_DIR is set by default through pam_systemd and is used for
# non-essential, user-specific data files such as sockets, named pipes, etc.
#
# user-specific non-essential (cached) data (analogous to /var/cache)
export XDG_CACHE_HOME="$HOME/.cache"

# user-specific configurations (analogous to /var/cache)
export XDG_CONFIG_HOME="$HOME/.config"

# user-specific data files (analogous to /usr/share)
export XDG_DATA_HOME="$HOME/.local/share"

# user-specific state files (analogous to /var/lib)
export XDG_STATE_HOME="$HOME/.local/state"

# user-specific bin files
export XDG_BIN_HOME="$HOME/.local/bin"

# Create XDG Base Directories
mkdir -p $XDG_BIN_HOME \
         $XDG_CACHE_HOME \
         $XDG_CONFIG_HOME \
         $XDG_DATA_HOME \
         $XDG_STATE_HOME

export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="alacritty"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export FZF_DEFAULT_OPTS="--layout=reverse --height 20%"
export MANWIDTH=80
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export STARDICT_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
export SDCV_PAGER='batcat -p --pager "less --quit-if-one-screen -RX"'
export HOMEBREW_NO_ENV_HINTS='true'

# Golang
[ ! -d $XDG_DATA_HOME/go ] && mkdir -p $XDG_DATA_HOME/go
export GOPATH="$XDG_DATA_HOME/go"

# Rust
[ ! -d $XDG_CACHE_HOME/rust/cargo ] && mkdir -p $XDG_CACHE_HOME/rust/cargo
[ ! -d $XDG_CACHE_HOME/rust/rustup ] && mkdir -p $XDG_CACHE_HOME/rust/rustup
export CARGO_HOME="$XDG_CACHE_HOME/rust/cargo"
export RUSTUP_HOME="$XDG_CACHE_HOME/rust/rustup"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gems"

# OpenSSL .rnd file
export RANDFILE="$XDG_CACHE_HOME/.rnd"

# Update $PATH
export XDG_BIN_DIRS="$(du "$XDG_BIN_HOME" --exclude='.git' | \
    cut -f2 | sort | tr '\n' ':' | sed 's/:*$//')"
export XDG_BIN_DIRS="$XDG_BIN_DIRS:$CARGO_HOME/bin"
export XDG_BIN_DIRS="$XDG_BIN_DIRS:$GEM_HOME/bin"
export XDG_BIN_DIRS="$XDG_BIN_DIRS:$GOPATH/bin"
export PATH="$XDG_BIN_DIRS:$PATH"

# include ~/.bin in $PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

# disable XON/XOFF flow control
stty -ixon

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    alacritty|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# parse git branch for prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# set the prompt
if [ "$color_prompt" = yes ]; then
  PS1="\n\${debian_chroot:+($debian_chroot)}\[\e[37m\]\u@\h\[\e[00m\]: \e[1;34m\]\w \[\e[35m\]\$(parse_git_branch)\n\[\e[32m\]\$\[\e[00m\] ";
else
  PS1="\n${debian_chroot:+($debian_chroot)}\u@\h: \w \$(parse_git_branch)\n\$ ";
fi

unset color_prompt force_color_prompt

# # If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# BASH History
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash_history"
HISTSIZE=100000
HISTFILESIZE=2000000
HISTCONTROL=ignoreboth  # no dupes or lines starting with space
HISTTIMEFORMAT="%F %T "

# shopt
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s cmdhist      # save multi-line commands in history as single line
shopt -s histappend   # append history, don't overwrite it
shopt -s autocd       # change to named directory automatically
shopt -s direxpand    # expand dir names on completion

# Checks the window size after each external (non-builtin) command and, if
# necessary, updates the values of LINES and COLUMNS.
# Enabled by default as of Bash 5.0 beta 2.
# https://wiki.bash-hackers.org/scripting/bashchanges
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"
fi

# load alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# load function definitions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# create symlink for fd on Ubuntu
if [ -x "$(command -v 'fdfind')" ]; then
  ln -sf $(which fdfind) ~/.local/bin/fd
fi

# create symlink for bat on Ubuntu
if [ -x "$(command -v 'batcat')" ]; then
  ln -sf $(which batcat) ~/.local/bin/bat
fi

# include github cli completion if installed
if [ -x "$(command -v 'gh')" ]; then
  eval "$(gh completion -s bash)"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable completions for alias g='git'
# https://stackoverflow.com/a/39507158
source /usr/share/bash-completion/completions/git
__git_complete g __git_main

# load nix
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
  export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS}"
fi

# enable fzf keybinds and completions
[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash

# enable zoxide
[ -x "$(command -v 'zoxide')" ] && \
    eval "$(zoxide init bash)" && alias cd='z'

# load starship prompt
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"

# use linux brew when installed
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
