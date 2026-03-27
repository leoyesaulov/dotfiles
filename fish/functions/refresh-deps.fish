function refresh-deps --wraps='pacman -Qeq > ~/repos/dotfiles/modules.md' --description 'alias refresh-deps=pacman -Qeq > ~/repos/dotfiles/modules.md'
    pacman -Qeq > ~/repos/dotfiles/modules.md $argv
end
