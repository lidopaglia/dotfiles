#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

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
