# Personal dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a package that mirrors paths under `$HOME`.

## Structure

```
dotfiles/
├── devilspie2/   → ~/.config/devilspie2/
├── ghostty/      → ~/.config/ghostty/
├── git/          → ~/.gitconfig
├── kitty/        → ~/.config/kitty/
├── nvim/         → ~/.config/nvim/
├── tmux/         → ~/.tmux.conf
└── zsh/          → ~/.zshrc
```

## Stow

```sh
cd ~/dotfiles

stow */              # link all packages
stow nvim            # link one package
stow -R devilspie2   # re-link after adding files
stow -D nvim         # remove symlinks
```

Edits to already-linked files are live — re-stow only when adding or removing files.

## Devilspie2

Window rules live in `devilspie2/.config/devilspie2/*.lua`. Use `debug.lua` to inspect window properties, then restart:

```sh
killall devilspie2
devilspie2 --debug
```

## Other

```sh
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
```
