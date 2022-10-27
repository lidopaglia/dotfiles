#!/bin/bash

# Runs when bash is invoked as an interactive login shell, or as a
# non-interactive shell with the --login option.

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

export EDITOR="vim"
export BROWSER="brave-browser"
export TERMINAL="kitty"

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"

export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# App preferences and colors
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MANWIDTH=80
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export GREP_OPTIONS='--color=auto'


# https://wiki.archlinux.org/title/Sdcv
export STARDICT_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
export SDCV_PAGER='batcat -p --pager "less --quit-if-one-screen -RX"'

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

# include ~/.bin if it exists
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

# if running bash, source .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
