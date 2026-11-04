#!/usr/bin/env bash
# Bootstrap: install the packages the hyprland/kitty/fish/fastfetch configs
# need, then hand off to install.fish to link the configs.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

warn() { printf '\033[33mwarning:\033[0m %s\n' "$*" >&2; }

# configs hardcode this path (kitty session, fastfetch logo, hyprland.lua, hypr links)
if [[ "$REPO_DIR" != "$HOME/repos/dotfiles" ]]; then
	warn "repo is at $REPO_DIR, but configs expect $HOME/repos/dotfiles."
fi

packages=(
	hyprland kitty fish fastfetch # configured programs
	hypridle hyprlock             # linked by hypr/install.sh, autostarted / used as lock_cmd
	awww                          # wallpaper daemon autostarted in hypr/execs.lua
)

sudo pacman -S --needed "${packages[@]}"

exec fish "$REPO_DIR/install.fish"
