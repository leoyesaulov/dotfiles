#!/usr/bin/env fish
# Link hyprland, kitty, fish and fastfetch configs from this repo into ~/.config.
# Packages are installed by install.sh, which calls this script.

set -l repo (path resolve (status dirname))
set -l conf (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo ~/.config)

echo "Linking configs from $repo"

# fish: symlink each function (leaves non-repo functions alone)
mkdir -p $conf/fish/functions
for file in $repo/fish/functions/*.fish
    ln -sf $file $conf/fish/functions/(path basename $file)
end
echo "fish functions -> $conf/fish/functions"

# hyprland: backs up existing configs and links hypr/links/*
bash $repo/hypr/install.sh
or echo "warning: hypr/install.sh failed" >&2

# kitty: kitty.conf only includes the repo config
set -l kitty_conf $conf/kitty/kitty.conf
set -l kitty_line "include $repo/kitty/source.conf"
mkdir -p $conf/kitty
if test -e $kitty_conf; or test -L $kitty_conf
    if test "$(cat $kitty_conf 2>/dev/null)" != "$kitty_line"
        mv -f $kitty_conf $kitty_conf.bak
        echo "backed up old kitty.conf -> $kitty_conf.bak"
    end
end
echo $kitty_line >$kitty_conf
echo "kitty.conf -> $kitty_line"

# fastfetch: symlink config
mkdir -p $conf/fastfetch
ln -sfn $repo/fastfetch/config.jsonc $conf/fastfetch/config.jsonc
echo "fastfetch config -> $conf/fastfetch/config.jsonc"

echo "Done."
