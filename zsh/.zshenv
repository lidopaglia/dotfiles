#!/bin/zsh

export EDITOR="nvim"
export TERMINAL="gnome-terminal"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh_history"

export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export DICS="/usr/share/stardict/dic/"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MANWIDTH=80
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

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
export PATH="$XDG_BIN_HOME:$PATH"
