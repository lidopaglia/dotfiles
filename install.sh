# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.bat \
    nixpkgs.curl \
    nixpkgs.delta \
    nixpkgs.direnv \
    nixpkgs.fd \
    nixpkgs.fzf \
    nixpkgs.gcc \
    nixpkgs.git \
    nixpkgs.gnumake \
    nixpkgs.kitty \
    nixpkgs.neovim \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.tmux \
    nixpkgs.tree \
    nixpkgs.wget \
    nixpkgs.zoxide \
    nixpkgs.zsh
