# .zshrc

autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# Enable comments when working in an interactive shell.
setopt interactive_comments

# Configure Prompt


BLUE=$'%{\e[1;34m%}'
RED=$'%{\e[1;31m%}'
GREEN=$'%{\e[1;32m%}'
CYAN=$'%{\e[1;36m%}'
WHITE=$'%{\e[1;37m%}'
MAGENTA=$'%{\e[1;35m%}'
YELLOW=$'%{\e[1;33m%}'
NO_COLOR=$'%{\e[0m%}'


# secondary prompt, printed when the shell needs more information to complete a
# command.
PS2='\`%_> '
# selection prompt used within a select loop.
PS3='?# '
# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '

#PS1="%{$fg[magenta]%}[%~] %{$reset_color%}%b"

# Prompt. Using single quotes around the PROMPT is very important, otherwise
# the git branch will always be empty. Using single quotes delays the
# evaluation of the prompt. Also PROMPT is an alias to PS1.
git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ -n "${branch}" ] && echo " (${branch})"
}
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}%n@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '







# Create required dirs
[ -d "${XDG_CACHE_HOME}/zsh" ] || \
    mkdir -p "${XDG_CACHE_HOME}/zsh"

# Use modern completion system. Other than enabling globdots for showing
# hidden files, these ares values in the default generated zsh config.
autoload -Uz compinit
zmodload zsh/complist # make sure module is loaded before the call to compinit.
compinit -d $XDG_CACHE_HOME/.zcompdump-$ZSH_VERSION
# Include hidden files in autocomplete
_comp_options+=(globdots)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

# load alias file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc" ] && \
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc"

# load functions file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/funcsrc" ] && \
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/funcsrc"

# Dirstack handling
DIRSTACKFILE="$XDG_CACHE_HOME/zsh/zdirs"
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# History Config
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
HISTSIZE=1000000                # History lines stored in memory.
SAVEHIST=1000000                # History lines stored on disk.
setopt BANG_HIST                # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY         # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS        # Do not display a line previously found.
setopt HIST_IGNORE_SPACE        # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY              # Don't execute immediately upon history expansion.

setopt nobeep

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
