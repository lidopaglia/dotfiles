# dotfiles

These are my dotfiles, a collection of user-specific [configuration
files][1] for [UNIX-like][3] systems.

## Requirements

The `stow` branch of this repository is configured for use with [GNU
Stow][2]. To get started, clone the repo locally and use to stow to create
symlinks for the desired configuration.

- Neovim >= 0.5.0
- Newish version of `git`.

We also want these apps/fonts/things installed.

- bat
- curl
- delta
- fd
- glow
- gruvbox
- imagemagick, ffmpeg, mp4grep, mpv, mpd, ncmpcpp
- ncal
- pass
- ripgrep
- sauce code pro (nerd font)
- ssh
- stow
- tmux
- tree
- viddy
- wget

## Install

```bash
$ git clone git@github.com:lidopaglia/dotfiles.git ~/.dotfiles && cd .dotfiles
$ stow nvim tmux ssh git # plus whatever else
```

Clone the repo locally:

```sh
git clone https://github.com/lidopaglia/dotfiles .dotfiles
```

Call stow on the desired configuration(s):

```sh
stow bash git nvim shell ssh tmux
```

To install just the neovim config:

```bash
$ git clone git@github.com:lidopaglia/dotfiles.git ~/.dotfiles && cd .dotfiles
$ stow nvim
```

With neovim installed and the config stowed, launch neovim and then run
`:PackerSync`. After all plugins install quit `nvim` and relaunch.

Alternatively run:

```sh
nvim --headless +PackerSync +qall
```

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
