function save-aliases
	for file in ~/.config/fish/functions/*;
		cp "$file" "/home/omni/repos/dotfiles/fish/functions/$(path basename $file)"
	end;
	echo "Aliases saved successfully."

	# commit changes
	cd ~/repos/dotfiles/ &&
	git add fish/functions/ &&
	git commit -m "(auto) Update fish functions"
	echo "Commit successfull"
end
