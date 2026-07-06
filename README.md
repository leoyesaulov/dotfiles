clone into ~/repos/ -> Todo: relative dirs
source source.conf in main hyprland.conf (under .config/hypr/)
refresh dependency list: refresh-deps (alias for pacman -Qeq >> modules.md)
to install deps use: cat modules.md | xargs sudo pacman -S

ToDo: 
  - configure notifications when configuring quickshell (notify-send)
  - upd install script with pointing to configs
  - quickshell setup

Notes: 
  - links directory contains config files that are to be moved into .confi directories. They source other config files from the repo.
  - dont forget to link fastfetch configs with <ln targetfile linkname>

  Printer Setup:
  - install cups
  - enable and start cups.service
  - get drivers (common: cups-pdf and foomatic-db) (brother-specific: brlaser)
  - goto localhost:631 and configure
  - use 'lp' to print
