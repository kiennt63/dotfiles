---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local theme = {}
local pallete = {}

theme.font = "Ligamononoki Nerd Font, Medium 12"

 -- #f5e0dc
 -- #f2cdcd
 -- #f5c2e7
 -- #cba6f7
 -- #f38ba8
 -- #eba0ac
 -- #fab387
 -- #f9e2af
 -- #a6e3a1
 -- #94e2d5
 -- #89dceb
 -- #74c7ec
 -- #89b4fa
 -- #b4befe
 -- #cdd6f4
 -- #bac2de
 -- #a6adc8
 -- #9399b2
 -- #7f849c
 -- #6c7086
 -- #585b70
 -- #45475a
 -- #313244
 -- #1e1e2e
 -- #181825
 -- #11111b

pallete.aurora0 = "#f5e0dc"
pallete.aurora1 = "#f2cdcd"
pallete.aurora2 = "#f5c2e7"
pallete.aurora3 = "#cba6f7"
pallete.aurora4 = "#eba0ac"

pallete.frost0 = "#f2cdcd"
pallete.frost1 = "#f5c2e7"
pallete.frost2 = "#cba6f7"
pallete.frost3 = "#b4befe"

pallete.snow0 = "#cdd6f4"
pallete.snow1 = "#bac2de"
pallete.snow2 = "#a6adc8"


pallete.night0 = "##1e1e2e"
pallete.night1 = "##313244"
pallete.night2 = "##45475a"
pallete.night3 = "##585b70"

pallete.taglist_bg = "#00000000"

-- Colors
theme.fg_normal  = pallete.snow0
theme.fg_focus   = pallete.aurora0
theme.fg_urgent  = pallete.aurora4
theme.bg_normal  = pallete.night0
theme.bg_focus   = pallete.night1
theme.bg_urgent  = pallete.night2
theme.wibar_opacity = 1.0
theme.wibar_bg = "#181825"
theme.bg_systray = "#181825"

theme.pallete = pallete

-- Borders
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(2)
theme.border_normal = pallete.night2
theme.border_focus  = pallete.aurora0
theme.border_marked = pallete.aurora4

-- Taglist colorize
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_urgent = "#00000000"
theme.taglist_fg_focus = pallete.aurora0
theme.taglist_fg_occupied = pallete.fg_normal
theme.taglist_fg_empty = pallete.fg_normal

theme.taglist_squares_sel   = custom_themes_path .. "catppuccin/taglist/catppuccin_sel.png"
theme.taglist_squares_unsel = custom_themes_path .. "catppuccin/taglist/catppuccin_unsel.png"

-- Wallpaper
theme.wallpaper = "~/dotfiles/wallpapers/flatppuccin_4k_macchiato.png"

-- Layout icons
theme.layout_tile       = custom_themes_path .. "catppuccin/layouts/catppuccin_tile.png"
theme.layout_max        = custom_themes_path .. "catppuccin/layouts/catppuccin_float.png"

return theme
