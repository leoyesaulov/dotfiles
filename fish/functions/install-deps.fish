function install-deps
	echo "Deps to install:"
	set depslist $(cat ~/repos/dotfiles/modules.md)
	echo $depslist
	sudo pacman -S $depslist
	echo "Deps installation done."
end
