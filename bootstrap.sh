#!/bin/bash

set -euo pipefail

INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

command_exists() {
    command -v "$1" > /dev/null 2>&1
}

install_brew() {
    /bin/bash -c "$1 $INSTALL_URL"
}

echo "Bootstrapping dotfiles..."

# Check if Homebrew is already installed
if command_exists brew; then
    echo "Homebrew is already installed. Skipping installation."
else
    # Check for curl or wget, and install Homebrew if neither is installed
    if command_exists curl; then
        install_brew "curl -fsSL"
    elif command_exists wget; then
        install_brew "wget -qO-"
    else
        echo "Neither curl nor wget is installed. Please install one of these tools and try again."
        exit 1
    fi
    echo "Homebrew installation completed."
fi

# Check if 'just' command is available
if command_exists just; then
    echo "'just' command found. Proceeding to run the 'just' recipe."
else
    # Install 'just' using Homebrew if not found
    echo "'just' command not found. Installing 'just' via Homebrew..."
    brew install just
fi

# Use 'just' to call the 'brew' recipe from the Justfile in the current directory
echo "Running 'just brew' recipe..."
just brew
echo "Bootstrapping dotfiles completed."
