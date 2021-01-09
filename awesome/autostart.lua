-- Autostart applications
local awful = require("awful")

-- For Dual Monitors (xrandr)
awful.spawn.with_shell("xrandr --output DVI-D-0 --off --output HDMI-0 --mode 2560x1080 --pos 0x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --mode 2560x1080 --pos 1080x975 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-5 --off")

-- Wallpapers
awful.spawn.with_shell("nitrogen --restore")

-- Compositor
awful.spawn.with_shell("compton")
