# dotfiles

These are my [dotfiles][1], a collection of user-specific configuration
files for [UNIX-like][3] systems.

This repository is configured for use with [GNU Stow][2]. To get started, clone
the repo and call `stow` to symlink the desired configuration.

```bash
git clone https://github.com/lidopaglia/dotfiles.git ~/.dotfiles
cd .dotfiles
stow bash shell git nvim tmux ssh
```

## Install Requirements

```
ansible-playbook bootstrap.yaml -bK
```

- [x] [bat](https://github.com/sharkdp/bat)
- [ ] [delta](https://github.com/dandavison/delta)
- [ ] [glow](https://github.com/charmbracelet/glow)
- [ ] [mp4grep](https://github.com/o-oconnell/mp4grep)
- [ ] [neovim](https://github.com/neovim/neovim)
- [ ] [viddy](https://github.com/sachaos/viddy)

# Graphical Apps

- [ ] [alacritty](https://github.com/alacritty/alacritty)
- [ ] [kitty](https://github.com/kovidgoyal/kitty)


## Installing Neovim

Follow the steps for [building from source][11]. [Prerequisites][12] for modern
Debian/Ubuntu are:

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

Clone the repository and build:

```
git clone https://github.com/neovim/neovim && cd neovim && make
sudo make install
```

With neovim installed and the config stowed, launch neovim and then run
`:PackerSync`. After all plugins install quit `nvim` and relaunch.

Alternatively run:

```sh
nvim --headless +PackerSync +qall
```

# Ansible steps

installing ansible on ubuntu first had to install `python-is-python3` then
when I successfully install ansible I had to quit the shell and login
again for it to pickup the newly install ansible command via pip.



## License

[GNU General Public License v3][4].

[1]: http://dotfiles.github.io/
[2]: https://www.gnu.org/software/stow/
[3]: https://www.computerhope.com/jargon/u/unix-like.htm
[4]: https://www.gnu.org/licenses/gpl-3.0.html
[5]: https://zsh.sourceforge.io/Intro/intro_3.html
[6]: https://github.com/morhetz/gruvbox
[7]: https://github.com/ryanoasis/nerd-fonts
[8]: https://github.com/sachaos/viddy
[9]: https://www.nerdfonts.com/
[10]: https://github.com/neovim/neovim
[11]: https://github.com/neovim/neovim/wiki/Building-Neovim
[12]: https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
[13]: https://github.com/neovim/neovim/wiki/FAQ#build-issues
