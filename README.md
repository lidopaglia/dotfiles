# dotfiles

These are my more-than-likely broken and out of date [dotfiles][1], a
collection of user-specific configuration files for [UNIX-like][2] systems that
I have meticulously curated because that was a good use of my time.

## Install

Clone the repo and run `just install` is the goal.

```bash
git clone https://github.com/lidopaglia/dotfiles ~/.dotfiles && cd .dotfiles
just install
```

Use `just` to see available recipes and install configurations, e.g. run `just
base` for a minimal setup or `just desktop` on a graphical desktop.

## License

[GNU General Public License v3][5].

[1]: http://dotfiles.github.io/
[2]: https://www.computerhope.com/jargon/u/unix-like.htm
[5]: https://www.gnu.org/licenses/gpl-3.0.html
