local awful = require("awful")

awful.spawn.with_shell("picom --experimental-backends -b")
awful.spawn.with_shell("~/.config/awesome/scripts/setup.sh")
awful.spawn.with_shell("ibus-daemon -r -d")
awful.spawn.with_shell("killall dunst")
awful.spawn.with_shell("dunst")
