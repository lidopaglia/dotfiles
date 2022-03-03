# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# git prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch
export PS1="\u@\h \[\e[32m\]\w \[\e[94m\]\$(parse_git_branch)\[\e[00m\]$ "

# BASH History
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash_history"
HISTSIZE=100000
HISTFILESIZE=2000000
HISTCONTROL=ignoreboth  # no dupes or lines starting with space
shopt -s histappend     # append, don't overwrite it
shopt -s autocd
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"
fi

# load alias definitions
if [ -f ~/.config/shell/aliasrc ]; then
    . ~/.config/shell/aliasrc
fi

# load function definitions
if [ -f ~/.config/shell/funcsrc ]; then
    . ~/.config/shell/funcsrc
fi

# create symlink for fd on Ubuntu
if [ -x "$(command -v 'fdfind')" ]; then
  ln -sf $(which fdfind) ~/.local/bin/fd
fi

# create symlink for bat on Ubuntu
if [ -x "$(command -v 'batcat')" ]; then
  ln -sf $(which batcat) ~/.local/bin/bat
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

