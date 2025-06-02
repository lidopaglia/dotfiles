# dotfiles

These are my [dotfiles][1], a collection of user-specific configuration
files for [UNIX-like][2] systems.

## Install

The repository layout is configured for use with [GNU Stow][3]. Clone the repo
and use `stow` to create symlinks for the desired configurations:

```bash
git clone https://github.com/lidopaglia/dotfiles ~/.dotfiles
cd .dotfiles && stow bash git tmux ssh
```

Dependencies can be installed via [Homebrew][4] with the included `Brewfile`.

```sh
cd ~/.dotfiles && brew bundle
```

## `tmux`

I'm using [gitmux][5] to show git status in the tmux status bar.

To install it via Homebrew: 

```sh
brew tap arl/arl
brew install gitmux
```

## License

[GNU General Public License v3][6].

[1]: http://dotfiles.github.io/
[2]: https://www.computerhope.com/jargon/u/unix-like.htm
[3]: https://www.gnu.org/software/stow/
[4]: https://brew.sh/
[5]: https://github.com/arl/gitmux
[6]: https://www.gnu.org/licenses/gpl-3.0.html
