echo -e "\ninstall.fish has been called"
set cwd $(pwd)

# copy fish functions into .config/fish
for file in ~/repos/dotfiles/fish/functions/*;
	cp $file "~/.config/fish/functions/$(path basename $file)"
end;

# install dependencies from modules.md
install-deps

# backup old hyprland config files
mkdir ~/.config/hypr/old-confs
for file in ~/.config/hypr/*;
	mv $file "~/.config/hypr/old-confs/$(path basename $file)"
end;

# copy linking config files into system configuration directory
for file in ~/repos/dotfiles/hypr/links/*;
	cp $file "~/.config/hypr/$(path basename $file)"
end;
	

cd $cwd
