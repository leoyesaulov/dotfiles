echo -e "\ninstall.fish has been called"
set cwd $(pwd)

for file in ~/repos/dotfiles/fish/functions/*;
	cp $file "~/.config/fish/functions/$(path basename $file)"
end;

install-deps
	

cd $cwd
