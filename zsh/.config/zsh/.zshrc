# .zshrc

autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# 
# Configure Prompts
# -----------------

# secondary prompt, printed when the shell needs more information to complete a
# command.
PS2='\`%_> '
# selection prompt used within a select loop.
PS3='?# '
# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '

# minimal prompt
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
compinit -d $XDG_CACHE_HOME/zsh/.zcompdump-$ZSH_VERSION
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

# DIRSTACK
# --------
DIRSTACKFILE="$XDG_CACHE_HOME/zsh/.zdirs"
setopt auto_cd # cd based on dirname alone.
setopt auto_pushd # make cd push the old dir onto the dir stack.
setopt pushd_ignore_dups # don't push the same dir twice.

# HISTORY
# -------
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
HISTSIZE=1000000                # History lines stored in memory.
SAVEHIST=1000000                # History lines stored on disk.
setopt append_history           # Default but let's lock it in.
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

setopt nobeep                   # Make it stop!
setopt nohup                    # Don't send SIGHUP to background processes when the shell exits.
setopt notify                   # report background job status immediately.
setopt noglobdots               # * shouldn't match dotfiles. ever.
setopt extendedglob
setopt completeinword           # not just at the end
setopt noshwordsplit            # use zsh style word splitting
setopt interactive_comments     # Enable comments when in an interactive shell.
setopt unset                    # don't error out when unset parameters are used.

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# Use emacs-like key bindings by default:
bindkey -e

# only slash should be considered as a word separator:
function slash-backward-kill-word () {
    local WORDCHARS="${WORDCHARS:s@/@}"
    # zle backward-word
    zle backward-kill-word
}
zle -N slash-backward-kill-word

# alt+backspace deletes backward.
# Run `showkey -a` for key codes: '^[^?'
bindkey '^[^?' slash-backward-kill-word

# auto quote/escape URLs
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# support forward delete (fn + delete) in macOS
# bindkey "\e[3~" delete-char

# reverse search with ctrl+r
# bindkey '^r' history-incremental-pattern-search-backward

# allow shift+tab to navigate backwards
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Load zsh-syntax-highlighting; should be last.
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
