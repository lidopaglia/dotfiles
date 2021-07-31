# .zshrc

autoload -U colors && colors

PS1="%{$fg[magenta]%}[%~] %{$reset_color%}%b"

# autoload -Uz compinit && compinit
autoload -Uz compinit
zstyle ':completion:*' menu select
# match on simple first https://stackoverflow.com/a/24237590
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
# compinit -d $XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION


# load alias file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && \
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt nobeep

# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


# Include hidden files in autocomplete
_comp_options+=(globdots)

 # auto quote URLS
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


# whenever a command completion is attempted, make sure the entire command path is hashed first.
# setopt hash_list_all

# support forward delete (fn + delete) in macOS
# bindkey "\e[3~" delete-char

# reverse search with ctrl+r
# bindkey '^r' history-incremental-pattern-search-backward

# allow shift+tab to navigate backwards
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Load zsh-syntax-highlighting; should be last.
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
