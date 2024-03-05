---------------------------
-- Default awesome theme --
---------------------------

local cairo = require("lgi").cairo
local surface = require("gears.surface")
local gears = require("gears")
local gears_color = require("gears.color")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local theme = {}

function create_taglist_indicator(size, fg)
	local img = cairo.ImageSurface(cairo.Format.ARGB32, size, size)
	local cr = cairo.Context(img)
	cr:set_source(gears_color(fg))
	cr:paint()
	return img
end

theme.font          = "Liga SFMono Nerd Font, Regular 12"

theme.pallete       = require('theme/palette')

-- Colors
theme.fg_normal     = theme.pallete.snow0
theme.fg_focus      = theme.pallete.frost0
theme.fg_urgent     = theme.pallete.aurora4
theme.bg_normal     = theme.pallete.night0
theme.bg_focus      = theme.pallete.night1
theme.bg_urgent     = theme.pallete.night2
theme.wibar_opacity = 1.0
theme.wibar_bg      = theme.pallete.night3
theme.bg_systray    = "#11111b"


-- Borders
theme.useless_gap         = dpi(4)
theme.border_width        = dpi(2)
theme.border_normal       = "#4c566a"
theme.border_focus        = theme.pallete.frost0
theme.border_marked       = theme.pallete.aurora0

-- Titlebars
theme.titlebar_bg_focus   = "#3B4252"
theme.titlebar_bg_normal  = "#2E3440"

-- Taglist colorize
theme.taglist_bg_focus    = "#00000000"
theme.taglist_bg_urgent   = "#00000000"
theme.taglist_fg_focus    = theme.pallete.frost0
theme.taglist_fg_occupied = theme.pallete.fg_normal
theme.taglist_fg_empty    = theme.pallete.fg_normal

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

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = create_taglist_indicator(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = create_taglist_indicator(
--     taglist_square_size, theme.fg_normal
-- )

-- theme.taglist_squares_sel   = custom_themes_path .. "nord/taglist/nord_sel.png"
-- theme.taglist_squares_unsel = custom_themes_path .. "nord/taglist/nord_unsel.png"

theme.menu_submenu_icon   = themes_path .. "default/submenu.png"
theme.menu_height         = dpi(15)
theme.menu_width          = dpi(100)

-- Wallpaper
theme.wallpaper           = theme.pallete.wallpaper

-- Layout icons
theme.layout_tile         = custom_themes_path .. "nord/tile.png"
theme.layout_tileleft     = custom_themes_path .. "nord/layouts/tileleft.png"
theme.layout_tilebottom   = custom_themes_path .. "nord/layouts/tilebottom.png"
theme.layout_tiletop      = custom_themes_path .. "nord/layouts/tiletop.png"
theme.layout_fairv        = custom_themes_path .. "nord/layouts/fairv.png"
theme.layout_fairh        = custom_themes_path .. "nord/layouts/fairh.png"
theme.layout_spiral       = custom_themes_path .. "nord/layouts/spiral.png"
theme.layout_dwindle      = custom_themes_path .. "nord/layouts/dwindle.png"
theme.layout_max          = custom_themes_path .. "nord/float.png"
theme.layout_fullscreen   = custom_themes_path .. "nord/layouts/fullscreen.png"
theme.layout_magnifier    = custom_themes_path .. "nord/layouts/magnifier.png"
theme.layout_floating     = custom_themes_path .. "nord/layouts/float.png"
theme.layout_cornernw     = custom_themes_path .. "nord/layouts/cornernw.png"
theme.layout_cornerne     = custom_themes_path .. "nord/layouts/cornerne.png"
theme.layout_cornersw     = custom_themes_path .. "nord/layouts/cornersw.png"
theme.layout_cornerse     = custom_themes_path .. "nord/layouts/cornerse.png"

return theme
