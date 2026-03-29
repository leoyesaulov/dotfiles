clone into ~/repos/ -> Todo: relative dirs
source source.conf in main hyprland.conf (under .config/hypr/)
refresh dependency list: refresh-deps (alias for pacman -Qeq >> modules.md)
to install deps use: cat modules.md | xargs sudo pacman -S

ToDo: 
  - configure notifications when configuring quickshell (notify-send)
  - upd install script with pointing to configs
  - quickshell setup

Notes: links directory contains config files that are to be moved into .confi directories. They source other config files from the repo.
