local awful = require("awful")

awful.spawn.with_shell("picom -b")
awful.spawn.with_shell("~/.config/awesome/scripts/setup.sh")
awful.spawn.with_shell("ibus-daemon -r -d")
awful.spawn.with_shell("keyd-application-mapper -d")
awful.spawn("killall dunst")
awful.spawn("dunst -conf ~/dotfiles/dunst/dunstrc")
