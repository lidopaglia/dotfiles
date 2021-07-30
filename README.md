# dotfiles

These are my dotfiles, a collection of user-specific [configuration
files][1] for [UNIX-like][3] systems.

## Requirements

The `stow` branch of this repository is configured for use with [GNU Stow][2].
To get started, clone the repo locally and use to stow to create symlinks for
the desired configuration.

```bash
$ git clone git@github.com:lidopaglia/dotfiles.git ~/.dotfiles && cd .dotfiles
$ stow neovim tmux ssh git # plus whatever else
```

## Usage

To install the neovim config:

```bash
$ git clone git@github.com:lidopaglia/dotfiles.git ~/.dotfiles && cd .dotfiles
$ stow neovim
```

With neovim installed and the config stowed, luanch neovim and then run
`:PlugInstall`. After all plugins install quit `nvim` and relaunch.

Note: The current config requires neovim 0.5.0

## Zsh

A `.zshenv` in `$HOME` is needed on debian/ubunutu/pop? There is no doubt
alwasy [more learning][5] to do.

## License

[GNU General Public License v3][4].

[1]: http://dotfiles.github.io/
[2]: https://www.gnu.org/software/stow/
[3]: https://www.computerhope.com/jargon/u/unix-like.htm
[4]: https://www.gnu.org/licenses/gpl-3.0.html
[5]: https://zsh.sourceforge.io/Intro/intro_3.html
