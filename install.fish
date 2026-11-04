#!/bin/fish

echo -e "\ninstall.fish has been called"

# copy fish functions into .config/fish
for file in ~/repos/dotfiles/fish/functions/*;
	cp $file "~/.config/fish/functions/$(path basename $file)"
end;

# install dependencies from modules.md
install-deps

# link hyprland configs (backs up existing ones)
bash ~/repos/dotfiles/hypr/install.sh

# create hard link for fastfetch config
rm -f ~/.config/fastfetch/config.jsonc
ln "~/repos/dotfiles/fastfetch/config.jsonc" "~/.config/fastfetch/config.jsonc"

# return to the working directory prior to script run
cd -
