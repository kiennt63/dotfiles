---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local theme = {}
local pallete = {}

theme.font = "SFMono Nerd Font, Medium 12"

pallete.aurora0 = "#B48EAD"
pallete.aurora1 = "#A3BE8C"
pallete.aurora2 = "#EBCB8B"
pallete.aurora3 = "#D08770"
pallete.aurora4 = "#BF616A"

pallete.frost0 = "#81A1C1"
pallete.frost1 = "#A3BE8C"
pallete.frost2 = "#EBCB8B"
pallete.frost3 = "#B48EAD"

pallete.snow0 = "#ECEFF4"
pallete.snow1 = "#E5E9F0"
pallete.snow2 = "#D8DEE9"


pallete.night0 = "#2E3440"
pallete.night1 = "#3B4252"
pallete.night2 = "#434C5E"
pallete.night3 = "#4C566A"

pallete.taglist_bg = "#00000000"

-- {{{ Colors
theme.fg_normal  = "#ECEFF4"
theme.fg_focus   = "#88C0D0"
theme.fg_urgent  = "#D08770"
theme.bg_normal  = "#2E3440"
theme.bg_focus   = "#3B4252"
theme.bg_urgent  = "#3B4252"
theme.bg_systray = theme.bg_normal
-- }}}

theme.pallete = pallete

-- {{{ Borders
theme.useless_gap   = dpi(3)
theme.border_width  = dpi(2)
theme.border_normal = "#4c566a"
theme.border_focus  = "#81A1C1"
theme.border_marked = "#D08770"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3B4252"
theme.titlebar_bg_normal = "#2E3440"
-- }}}


-- "#B48EAD"
-- "#A3BE8C"
-- "#EBCB8B"
-- "#D08770"
-- "#BF616A"

-- "#5E81AC"
-- "#81A1C1"
-- "#88C0D0"
-- "#8FBCBB"
-- Taglist colorize
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_urgent = "#00000000"
theme.taglist_fg_focus = "#81A1C1"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(5)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )
theme.taglist_squares_sel   = custom_themes_path .. "nord/taglist/sel.png"
theme.taglist_squares_unsel = custom_themes_path .. "nord/taglist/unsel.png"

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)

-- Wallpaper
theme.wallpaper = "/home/kiennt54/dotfiles/wallpapers/ign_endeavour2.png"

-- Layout icons
theme.layout_tile       = custom_themes_path .. "nord/tile.png"
theme.layout_tileleft   = custom_themes_path .. "nord/layouts/tileleft.png"
theme.layout_tilebottom = custom_themes_path .. "nord/layouts/tilebottom.png"
theme.layout_tiletop    = custom_themes_path .. "nord/layouts/tiletop.png"
theme.layout_fairv      = custom_themes_path .. "nord/layouts/fairv.png"
theme.layout_fairh      = custom_themes_path .. "nord/layouts/fairh.png"
theme.layout_spiral     = custom_themes_path .. "nord/layouts/spiral.png"
theme.layout_dwindle    = custom_themes_path .. "nord/layouts/dwindle.png"
theme.layout_max        = custom_themes_path .. "nord/float.png"
theme.layout_fullscreen = custom_themes_path .. "nord/layouts/fullscreen.png"
theme.layout_magnifier  = custom_themes_path .. "nord/layouts/magnifier.png"
theme.layout_floating   = custom_themes_path .. "nord/layouts/float.png"
theme.layout_cornernw   = custom_themes_path .. "nord/layouts/cornernw.png"
theme.layout_cornerne   = custom_themes_path .. "nord/layouts/cornerne.png"
theme.layout_cornersw   = custom_themes_path .. "nord/layouts/cornersw.png"
theme.layout_cornerse   = custom_themes_path .. "nord/layouts/cornerse.png"

theme.wibar_opacity = 1.0
theme.wibar_bg = "#242933"

return theme
