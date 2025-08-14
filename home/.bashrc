#!/usr/bin/env bash
#
# ~/.bashrc
#
# Executed by bash(1) for interactive non-login shells.
# See: /usr/share/doc/bash/examples/startup-files

# -- If not running interactively, don't do anything --------------------------

case $- in
*i*) ;;
*) return ;;
esac

# -- Source configs -----------------------------------------------------------

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi
unset rc

# -- XDG Base Directory Definitions -------------------------------------------

# XDG_RUNTIME_DIR is set by default through pam_systemd and is used for
# non-essential, user-specific data files such as sockets, named pipes, etc.
#
# See: https://wiki.archlinux.org/title/XDG_Base_Directory

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

# Create XDG Directories
mkdir -p "$XDG_BIN_HOME" \
    "$XDG_CACHE_HOME" \
    "$XDG_CONFIG_HOME" \
    "$XDG_DATA_HOME" \
    "$XDG_STATE_HOME"

# -- Update $PATH -------------------------------------------------------------

if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    export PATH
fi

# -- Shell optional behavior --------------------------------------------------
#
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

shopt -s autocd       # change to named directory automatically
shopt -s cdspell      # correct misspelled cd dir names
shopt -s checkwinsize # default as of Bash 5.0 beta 2
shopt -s cmdhist      # save multi-line commands in history as single line
shopt -s direxpand    # expand dir names on completion
shopt -s dirspell     # correct misspelled dir names
shopt -s histappend   # append history, don't overwrite it

# disable XON/XOFF flow control
stty -ixon

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# -- Exports ------------------------------------------------------------------

export EDITOR="vim"
export HISTCONTROL=ignoreboth # exclude dupes or lines starting with space
export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTTIMEFORMAT="%F %T "
export LESSHISTFILE="-"
export PAGER="less"
export MANWIDTH=80
export TZ="America/New_York"
export VISUAL="vim"

# systemctl uses less with 'FRSXMK' parameters as default.
# Removing 's' to disable folding long lines.
export SYSTEMD_LESS="FRXMK"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:'\
    'caret=01;32:locus=01:quote=01'

# -- Enable zoxide ------------------------------------------------------------

if exists zoxide; then
    eval "$(zoxide init bash)" && alias cd='z'
fi

# -- Enable brew --------------------------------------------------------------

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_ENV_HINTS='true'
    export HOMEBREW_PREFIX="$(brew --prefix)"

    # also enable brew completions
    # https://docs.brew.sh/Shell-Completion
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
            [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
    fi
fi

# -- End ----------------------------------------------------------------------
