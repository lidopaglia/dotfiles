# dotfiles

These are my [dotfiles][1], a collection of user-specific configuration
files for [UNIX-like][3] systems.

This repository is configured for use with [GNU Stow][2]. To get started, clone
the repo locally and use to `stow` to create symlinks for the desired
configurations.

## Requirements

- `git`
- bat
- curl
- delta
- fd
- ffmpeg
- glow
- gruvbox
- imagemagick
- mp4grep
- mpd
- mpv
- ncal
- ncmpcpp
- neovim >= 0.5.0
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
$ stow bash shell git nvim tmux ssh
```

## Neovim Setup

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
