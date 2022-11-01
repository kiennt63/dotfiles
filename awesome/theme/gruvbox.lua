---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local theme = {}
local pallete = {}

theme.font = "Ligamononoki Nerd Font, Medium 14"

-- '#ea6962'
-- '#e78a4e'
-- '#d8a657'
-- '#a9b665'
-- '#89b482'
-- '#7daea3'
-- '#d3869b'

pallete.aurora0 = "#d3869b"
pallete.aurora1 = "#a9b665"
pallete.aurora2 = "#d8a657"
pallete.aurora3 = "#e78a4e"
pallete.aurora4 = "#ea6962"

pallete.frost0 = pallete.aurora4
pallete.frost1 = pallete.aurora2
pallete.frost2 = pallete.aurora1
pallete.frost3 = pallete.aurora0

pallete.extra0 = "#7daea3"
pallete.extra1 = "#89b482"

pallete.snow0 = "#ddc7a1"
pallete.snow1 = "#d4be98"
pallete.snow2 = "#a89984"


pallete.night0 = "#282828"
pallete.night1 = "#32302f"
pallete.night2 = "#45403d"
pallete.night3 = "#5a524c"

pallete.taglist_bg = "#00000000"

-- '#282828'
-- '#32302f'
-- '#32302f'
-- '#45403d'
-- '#45403d'
-- '#5a524c'
-- '#32302f'
-- '#3a3735'
-- '#504945'
-- '#34381b'
-- '#3b4439'
-- '#402120'
-- '#4c3432'
-- '#0e363e'
-- '#374141'
-- '#4f422e'
-- '#3c3836'
--
-- '#d4be98'
-- '#ddc7a1'
-- '#ea6962'
-- '#e78a4e'
-- '#d8a657'
-- '#a9b665'
-- '#89b482'
-- '#7daea3'
-- '#d3869b'
-- '#ea6962'
-- '#a9b665'
-- '#d8a657'
--
-- '#a89984'
-- '#928374'
-- '#7c6f64'


-- Colors
theme.fg_normal  = pallete.night0
theme.fg_focus   = pallete.extra0
theme.fg_urgent  = pallete.aurora3
theme.bg_normal  = pallete.night0
theme.bg_focus   = pallete.night2
theme.bg_urgent  = pallete.night2
theme.bg_systray = theme.bg_normal

theme.pallete = pallete

-- Border
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)
theme.border_normal = pallete.night2
theme.border_focus  = pallete.aurora1
theme.border_marked = pallete.aurora3

-- Taglist colorize
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_bg_focus      = "#00000000"
theme.taglist_bg_urgent     = "#00000000"
theme.taglist_fg_occupied   = pallete.snow0
theme.taglist_fg_empty      = pallete.snow0
theme.taglist_fg_urgent     = pallete.snow0
theme.taglist_fg_focus      = pallete.aurora1

theme.taglist_squares_sel   = custom_themes_path .. "nord/taglist/gruv_sel.png"
theme.taglist_squares_unsel = custom_themes_path .. "nord/taglist/gruv_unsel.png"

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)

-- Wallpaper
theme.wallpaper = "/home/kiennt54/dotfiles/wallpapers/wallpapers-master/gruvbox/wolf.jpg"

-- Layout icons
theme.layout_tile       = custom_themes_path .. "nord/layouts/tile_nord_350.png"
theme.layout_tileleft   = custom_themes_path .. "nord/layouts/tileleft.png"
theme.layout_tilebottom = custom_themes_path .. "nord/layouts/tilebottom.png"
theme.layout_tiletop    = custom_themes_path .. "nord/layouts/tiletop.png"
theme.layout_fairv      = custom_themes_path .. "nord/layouts/fairv.png"
theme.layout_fairh      = custom_themes_path .. "nord/layouts/fairh.png"
theme.layout_spiral     = custom_themes_path .. "nord/layouts/spiral.png"
theme.layout_dwindle    = custom_themes_path .. "nord/layouts/dwindle.png"
theme.layout_max        = custom_themes_path .. "nord/layouts/float_nord_350.png"
theme.layout_fullscreen = custom_themes_path .. "nord/layouts/fullscreen.png"
theme.layout_magnifier  = custom_themes_path .. "nord/layouts/magnifier.png"
theme.layout_floating   = custom_themes_path .. "nord/layouts/float.png"
theme.layout_cornernw   = custom_themes_path .. "nord/layouts/cornernw.png"
theme.layout_cornerne   = custom_themes_path .. "nord/layouts/cornerne.png"
theme.layout_cornersw   = custom_themes_path .. "nord/layouts/cornersw.png"
theme.layout_cornerse   = custom_themes_path .. "nord/layouts/cornerse.png"

theme.wibar_opacity = 1.0
theme.wibar_bg = "#ffffff00"

return theme
