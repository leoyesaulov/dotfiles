function install-deps
	echo "Deps to install:"
	set depslist $(cat ~/repos/dotfiles/modules.md)
	echo $depslist
	sudo pacman -S $depslist
	echo -e "\nDeps installation done."
end
