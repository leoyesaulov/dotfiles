-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("sleep 1 && awww img ~/repos/dotfiles/wallpapers/wallhaven-ayanami.png --transition-type center --transition-fps 144 --transition-bezier .7,.22,.3,.78 --transition-duration 2")
    hl.exec_cmd("hypridle")
    -- hl.exec_cmd("kitty")
    -- hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("waybar & hyprpaper & firefox")
end)
