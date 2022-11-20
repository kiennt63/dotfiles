---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local theme = {}
local pallete = {}

theme.font = "Ligamononoki Nerd Font, Medium 12"

	-- #f2d5cf
	-- #eebebe	
	-- #f4b8e4	
	-- #ca9ee6	
	-- #e78284	
	-- #ea999c	
	-- #ef9f76	
	-- #e5c890	
	-- #a6d189	
	-- #81c8be	
	-- #99d1db	
	-- #85c1dc	
	-- #8caaee	
	-- #babbf1	
	-- #c6d0f5	
	-- #b5bfe2	
	-- #a5adce	
	-- #949cbb	
	-- #838ba7	
	-- #737994	
	-- #626880	
	-- #51576d	
	-- #414559	
	-- #303446	
	-- #292c3c	
	-- #232634	

pallete.aurora0 = "#f2d5cf"
pallete.aurora1 = "#eebebe"
pallete.aurora2 = "#f4b8e4"
pallete.aurora3 = "#ca9ee6"
pallete.aurora4 = "#ea999c"

pallete.frost0 = "#eebebe"
pallete.frost1 = "#f4b8e4"
pallete.frost2 = "#ca9ee6"
pallete.frost3 = "#babbf1"

pallete.snow0 = "#c6d0f5"
pallete.snow1 = "#b5bfe2"
pallete.snow2 = "#a5adce"


pallete.night0 = "#303446"
pallete.night1 = "#414559"
pallete.night2 = "#51576d"
pallete.night3 = "#626880"

pallete.taglist_bg = "#00000000"

-- Colors
theme.fg_normal  = pallete.snow0
theme.fg_focus   = pallete.aurora0
theme.fg_urgent  = pallete.aurora4
theme.bg_normal  = pallete.night0
theme.bg_focus   = pallete.night1
theme.bg_urgent  = pallete.night2
theme.wibar_opacity = 1.0
theme.wibar_bg = "#232634"
theme.bg_systray = "#232634"

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
theme.wallpaper = "/home/kiennt54/dotfiles/wallpapers/flatppuccin_4k_macchiato.png"

-- Layout icons
theme.layout_tile       = custom_themes_path .. "catppuccin/layouts/catppuccin_tile.png"
theme.layout_max        = custom_themes_path .. "catppuccin/layouts/catppuccin_float.png"

return theme
