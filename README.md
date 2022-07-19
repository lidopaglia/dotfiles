# dotfiles

These are my [dotfiles][1], a collection of user-specific configuration
files for [UNIX-like][2] systems.

## Install

This repository is configured for use with [GNU Stow][3]. To get started, clone
the repo locally and use to `stow` to create symlinks for the desired
configurations:

```bash
git clone https://github.com/lidopaglia/dotfiles ~/.dotfiles
cd .dotfiles && stow bash shell git nvim tmux ssh
```

## License

[GNU General Public License v3][4].

[1]: http://dotfiles.github.io/
[2]: https://www.computerhope.com/jargon/u/unix-like.htm
[3]: https://www.gnu.org/software/stow/
[4]: https://www.gnu.org/licenses/gpl-3.0.html
