#!/bin/bash

set -euo pipefail

HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/lidopaglia/dotfiles.git"
OLD_BASH_DIR="$HOME/old_bash"

command_exists() {
    command -v "$1" > /dev/null 2>&1
}

clone_dotfiles() {
    # Clone the dotfiles repo into the user's home directory as .dotfiles
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "Cloning dotfiles repository into $DOTFILES_DIR..."
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    else
        echo "Dotfiles repository already exists at $DOTFILES_DIR. Skipping clone."
    fi
}

install_brew() {
    # Check if Homebrew is already installed
    if command_exists brew; then
        echo "Homebrew is already installed. Skipping installation."
    else
        # Check for curl or wget, and install Homebrew if neither is installed
        if command_exists curl; then
            /bin/bash -c "curl -fsSL $HOMEBREW_URL"
        elif command_exists wget; then
            /bin/bash -c "wget -qO- $HOMEBREW_URL"
        else
            echo "Neither curl nor wget is installed. Please install one of these tools and try again."
            exit 1
        fi
        echo "Homebrew installation completed."
    fi
}

install_just() {
    # Check if 'just' command is available
    if command_exists just; then
        echo "'just' command found. Proceeding to run the 'just' recipe."
    else
        # Install 'just' using Homebrew if not found
        echo "'just' command not found. Installing 'just' via Homebrew..."
        brew install just
    fi
}

echo "Bootstrapping dotfiles..."

# Install Homebrew
install_brew

# Use 'just' to call the 'brew' recipe from the Justfile in the current directory
echo "Running 'just brew' recipe..."
just brew


# Change to the .dotfiles directory
cd "$DOTFILES_DIR"

# Check for any files in the bash directory of the home folder and move them to 'old_bash'
if [ -d "$DOTFILES_DIR/bash" ]; then
    echo "Found '$DOTFILES_DIR/bash' directory. Checking files..."
    mkdir -p "$OLD_BASH_DIR"  # Create 'old_bash' folder if it doesn't exist

    # Loop through files in the 'bash' directory and move them to 'old_bash'
    for file in "$BASH_DIR"/*; do
        BASENAME=$(basename "$file")
        if [ -e "$HOME/$BASENAME" ]; then
            echo "Moving '$HOME/$BASENAME' to '$OLD_BASH_DIR/'"
            mv "$HOME/$BASENAME" "$OLD_BASH_DIR/"
        fi
    done

    echo "Files moved to '$OLD_BASH_DIR'."
else
    echo "No '$BASH_DIR' directory found."
fi

# Run stow to symlink bash files
if command_exists stow; then
    echo "Running 'stow bash'..."
    stow bash
else
    echo "'stow' command not found. Please install 'stow' and try again."
    exit 1
fi


echo "Bootstrapping dotfiles completed."
