#!/usr/bin/env bash
# Instalador único de dotfiles.
# Enlaza cada carpeta de ./config en ~/.config/<app> (symlink).
# Si ya existe una config real, la mueve a ~/.dotfiles-backup/<fecha>/ antes de enlazar.
#
# Uso:
#   ./install.sh              # instala todo
#   ./install.sh nvim ranger  # instala sólo esas apps
#   ./install.sh -n           # dry-run: muestra lo que haría
#   ./install.sh -u           # desinstala (quita los symlinks que apuntan aquí)
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$DOTFILES/config"
DEST="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY=0; UNINSTALL=0

while getopts "nuh" opt; do
  case $opt in
    n) DRY=1 ;;
    u) UNINSTALL=1 ;;
    h) sed -n '2,11p' "$0"; exit 0 ;;
    *) exit 1 ;;
  esac
done
shift $((OPTIND - 1))

run() { if [ "$DRY" -eq 1 ]; then echo "[dry-run] $*"; else "$@"; fi; }

if [ "$#" -gt 0 ]; then apps=("$@"); else
  apps=(); for d in "$SRC"/*/; do apps+=("$(basename "$d")"); done
fi

run mkdir -p "$DEST"
for app in "${apps[@]}"; do
  src="$SRC/$app"; dst="$DEST/$app"
  [ -d "$src" ] || { echo "!! no existe config/$app"; continue; }

  if [ "$UNINSTALL" -eq 1 ]; then
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
      run rm "$dst"; echo "-- $app desenlazado"
    fi
    continue
  fi

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok $app (ya enlazado)"; continue
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    run mkdir -p "$BACKUP"
    run mv "$dst" "$BACKUP/$app"
    echo ">> backup de $dst en $BACKUP/$app"
  fi
  run ln -s "$src" "$dst"
  echo "++ $app -> $dst"
done
