# dotfiles

Omarchy config that survives reinstalls and version bumps.

## Setup on a fresh machine

```bash
git clone https://github.com/christophrumpel/dotfiles-omarchy.git ~/dotfiles
~/dotfiles/install.sh
omarchy restart terminal
```

`install.sh` symlinks every file under `config/` to the same path under
`~/.config/`. Anything it would overwrite is moved to
`~/.config-backup/<timestamp>/` first.

## Adding a config

Move the file into `config/` at its path relative to `~/.config`, then re-run
`install.sh`:

```bash
mkdir -p ~/dotfiles/config/hypr
mv ~/.config/hypr/bindings.lua ~/dotfiles/config/hypr/
~/dotfiles/install.sh
```

## Tracked

- `config/alacritty`, `config/foot`, `config/ghostty`, `config/kitty` — terminals (font size 18)

Not yet tracked, likely next: `hypr/` (keybindings, monitors, looknfeel),
`omarchy/shell.json` (bar and widgets), `starship.toml`, `tmux/`.
