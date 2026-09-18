#!/usr/bin/env bash
# Symlink everything in dotfiles/config/ into ~/.config/, preserving structure.
# Re-run any time. Safe to run repeatedly.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"

cd "$DOTFILES/config"
while IFS= read -r file; do
  target="$HOME/.config/$file"
  source="$DOTFILES/config/$file"

  # Already pointing at us? Nothing to do.
  if [[ "$(readlink -f "$target" 2>/dev/null)" == "$source" ]]; then
    echo "ok       $file"
    continue
  fi

  # Move a real file out of the way before replacing it.
  if [[ -e "$target" && ! -L "$target" ]]; then
    mkdir -p "$BACKUP/$(dirname "$file")"
    mv "$target" "$BACKUP/$file"
    echo "backup   $file -> $BACKUP/$file"
  fi

  mkdir -p "$(dirname "$target")"
  ln -sfn "$source" "$target"
  echo "linked   $file"
done < <(find . -type f -printf '%P\n' | sort)
