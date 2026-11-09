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
├── tmux/         → ~/.tmux.conf, ~/.local/bin/claude-tmux-*
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

## Tmux + Claude Code sessions

`tmux/.local/bin/claude-tmux-*` make tmux-resurrect (`prefix + C-s` / `prefix + C-r`) also resume the Claude Code session in each pane. The resurrect hooks are set in `tmux/.tmux.conf`. The SessionStart hook lives in `~/.claude/settings.json`, which is not tracked here, so add it by hand on a new machine:

```json
"hooks": {
  "SessionStart": [{ "hooks": [{ "type": "command", "command": "claude-tmux-sessionstart" }] }]
}
```

Sessions started before the hook was added are not recorded. Restart them once, and send a message, since a session is only resumable after its first message.

## Other

```sh
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
```
