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

