clone into ~/repos/ -> Todo: relative dirs
activate hyprland configs: hypr/install.sh (or hypr-install in fish) -> symlinks hypr/links/* into ~/.config/hypr
refresh dependency list: refresh-deps (alias for pacman -Qeq >> modules.md)
install (packages + hypr/kitty/fish/fastfetch configs): bash install.sh (or dotfiles-install in fish)
install full package list (optional): cat modules.md | xargs sudo pacman -S --needed

ToDo: 
  - configure notifications when configuring quickshell (notify-send)
  - quickshell setup
  - implement "move workspace between displays" bind

Notes: 
  - links directory contains config files that are to be moved into .confi directories. They source other config files from the repo.

  Printer Setup:
  - install cups
  - enable and start cups.service
  - get drivers (common: cups-pdf and foomatic-db) (brother-specific: brlaser)
  - goto localhost:631 and configure
  - use 'lp' to print
