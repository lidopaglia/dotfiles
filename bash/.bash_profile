#!/bin/bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export -f parse_git_branch
export PS1="\u@\h \[\e[32m\]\w \[\e[94m\]\$(parse_git_branch)\[\e[00m\]$ "

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export BROWSER="brave"
export TERMINAL="gnome-terminal"

#export GDK_SCALE=1
#export GDK_DPI_SCALE=0.75

#export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
#export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh_history"

#export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
#export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export SUDO_ASKPASS="$XDG_BIN_HOME/dmenupass"

export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export DICS="/usr/share/stardict/dic/"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MANWIDTH=80

# Rust
[ ! -d $XDG_CACHE_HOME/rust/cargo ] && mkdir -p $XDG_CACHE_HOME/rust/cargo
[ ! -d $XDG_CACHE_HOME/rust/rustup ] && mkdir -p $XDG_CACHE_HOME/rust/rustup
export CARGO_HOME="$XDG_CACHE_HOME/rust/cargo"
export RUSTUP_HOME="$XDG_CACHE_HOME/rust/rustup"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gems"

# OpenSSL .rnd file
export RANDFILE="$XDG_CACHE_HOME/.rnd"

# PATH
#export PATH="$XDG_BIN_HOME:$PATH"

# PATH
export XDG_BIN_DIRS="$(du "$XDG_BIN_HOME" --exclude='.git' | \
    cut -f2 | sort | tr '\n' ':' | sed 's/:*$//')"
export XDG_BIN_DIRS="$XDG_BIN_DIRS:$CARGO_HOME/bin"
export XDG_BIN_DIRS="$XDG_BIN_DIRS:$GEM_HOME/bin"
export PATH="$PATH:$XDG_BIN_DIRS"


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
