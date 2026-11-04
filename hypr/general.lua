------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({ output = "",         mode = "preferred",       position = "auto",    scale = "auto" })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@60",    position = "0x-1440", scale = 1 })
hl.monitor({ output = "eDP-1",    mode = "1920x1080@144",   position = "0x0",     scale = 1 })


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/configuring/extra/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
