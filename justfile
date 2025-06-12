#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

#set shell := ["bash", "-eu", "-o", "pipefail"]

# list available recipes
default:
    @just --list

# Install all packages listed in Brewfile
brew:
    command -v brew > /dev/null || (echo "Homebrew is not installed." && exit 1)
    test -f "Brewfile" || (echo "Brewfile not found." && exit 1)
    brew bundle --file=./Brewfile

# Export installed Homebrew pacakges to Brewfile
dump:
    command -v brew > /dev/null || (echo "Homebrew is not installed." && exit 1)
    brew bundle dump -f --file=./Brewfile --brews


tmpdir := `mktemp -d`
# install lscolors.sh
lscolors-install:
    curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master \
            | tar xzf - --directory={{tmpdir}} --strip=1
    cd {{tmpdir}} && make install >/dev/null 2>&1
    rm -rf {{tmpdir}}

# remove lscolors.sh and lscolors.csh
lscolors-clean:
    rm ~/.local/share/lscolors.sh
    rm ~/.local/share/lscolors.csh
