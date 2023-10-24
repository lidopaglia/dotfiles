#!/bin/bash

# .bash_profile
#
# Invoked by an interactive login shell, or from 
# a non-interactive shell with the --login option.

# source .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
