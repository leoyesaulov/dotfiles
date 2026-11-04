#!/usr/bin/env bash
# Activate the hyprland (lua) configs from this repo by symlinking
# everything in hypr/links/ into ~/.config/hypr. Existing non-repo files
# there are moved to ~/.config/hypr/old-confs/<timestamp>/ first.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LINKS_DIR="$REPO_DIR/hypr/links"
CONF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hypr"
BACKUP_DIR="$CONF_DIR/old-confs/$(date +%Y%m%d-%H%M%S)"
MIN_VERSION="0.57"

warn() { printf '\033[33mwarning:\033[0m %s\n' "$*" >&2; }

mkdir -p "$CONF_DIR"

# back up anything that isn't already a symlink into this repo
backed_up=()
shopt -s nullglob dotglob
for f in "$CONF_DIR"/*; do
	name="$(basename "$f")"
	[[ "$name" == "old-confs" ]] && continue
	if [[ -L "$f" ]]; then
		target="$(readlink -f "$f" || true)"
		[[ "$target" == "$REPO_DIR"/* ]] && continue
	fi
	mkdir -p "$BACKUP_DIR"
	mv -- "$f" "$BACKUP_DIR/$name"
	backed_up+=("$name")
done

# link entry-point configs
linked=()
for src in "$LINKS_DIR"/*; do
	name="$(basename "$src")"
	ln -sfn -- "$src" "$CONF_DIR/$name"
	linked+=("$name")
done
shopt -u nullglob dotglob

echo "Linked into $CONF_DIR:"
for n in "${linked[@]}"; do echo "  $n -> $LINKS_DIR/$n"; done
if ((${#backed_up[@]})); then
	echo "Backed up to $BACKUP_DIR:"
	for n in "${backed_up[@]}"; do echo "  $n"; done
fi

# sanity: hyprland.lua hardcodes the repo path in package.path
if ! grep -qF "$REPO_DIR/hypr/?.lua" "$LINKS_DIR/hyprland.lua"; then
	warn "package.path in $LINKS_DIR/hyprland.lua does not point at $REPO_DIR/hypr/ - update it."
fi

# sanity: lua configs need Hyprland >= 0.57
version_ok=1
if command -v Hyprland >/dev/null 2>&1; then
	version="$(Hyprland --version 2>/dev/null | grep -oP 'Hyprland \K[0-9]+\.[0-9]+(\.[0-9]+)?' | head -n1 || true)"
	if [[ -n "$version" ]] && [[ "$(printf '%s\n%s\n' "$MIN_VERSION" "$version" | sort -V | head -n1)" != "$MIN_VERSION" ]]; then
		version_ok=0
		warn "Hyprland $version is installed; lua configs need >= $MIN_VERSION. Upgrade before relogging."
	fi
else
	warn "Hyprland not found in PATH."
fi

# reload the running session (only if it can actually read lua configs)
if [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]] && ((version_ok)) && command -v hyprctl >/dev/null 2>&1; then
	{ hyprctl reload >/dev/null && echo "Reloaded running Hyprland."; } || warn "hyprctl reload failed."
fi
