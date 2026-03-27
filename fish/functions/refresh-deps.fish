function refresh-deps --wraps='pacman -Qeq > ~/repos/dotfiles/modules.md' --description 'alias refresh-deps=pacman -Qeq > ~/repos/dotfiles/modules.md'
    pacman -Qeq > ~/repos/dotfiles/modules.md $argv

    # commit changes
    cd ~/repos/dotfiles/
    git add modules.md
    git commit -m "(auto) Update module list"
end
