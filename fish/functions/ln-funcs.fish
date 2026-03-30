function upd-funcs
	argparse "h/help" "b/backup" -- $argv
	or return

	if set -q _flag_help
		echo "Usage: upd-funcs [option] <input>"
		echo "Options:"
		echo " -h, --help:   Display this message"
		echo " -b, --backup: Backup your existing functions"
		return
	end

	if set -q _flag_backup
		#backup old functions
		mkdir ~/.config/fish/functions/backup
		for file in ~/.config/fish/functions/*;
			mv $file "$(path dirname $file)/backup/$(path basename $file)"
		end;
	end;

	# link functions
	for file in ~/repos/dotfiles/fish/functions/*;
		ln -f $file "/home/omni/.config/fish/functions/$(path basename $file)"
	end;

	echo "Function linking is now complete."
end
