local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local custom_themes_path = string.format("%s/dotfiles/awesome/theme/", os.getenv("HOME"))

local mytextclock = wibox.widget.textclock()

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    awful.tag({
        "1 ",
        "1 ",
        "1 ",
        "1 ",
        "1 ",
        "1 ",
        "1 ",
        "1 ",
        "1 ",
    }, s, awful.layout.layouts[1])

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))


    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
    s.mytaglist = require('core.bar.taglist')(s)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(28) })
    s.systray = wibox.widget.systray(true)
    s.systray:set_base_size(dpi(20))

    -- Custom widget
    s.volume, s.volume_timer = awful.widget.watch(".config/awesome/core/bar/widgets/volume", 1)
    s.volume:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            awful.spawn("pamixer -t", false)
            s.volume_timer:emit_signal("timeout")
        elseif button == 3 then
            awful.spawn.with_shell("pavucontrol")
        elseif button == 4 then
            awful.spawn("pamixer -i 5 --allow-boost --set-limit 150", false)
            s.volume_timer:emit_signal("timeout")
        elseif button == 5 then
            awful.spawn("pamixer -d 5 --allow-boost --set-limit 150", false)
            s.volume_timer:emit_signal("timeout")
        end
    end)

    s.battery = awful.widget.watch(".config/awesome/core/bar/widgets/battery", 10)
    -- s.wifi = awful.widget.watch(".config/awesome/core/bar/widgets/wifi", 10)
    -- s.brightness = awful.widget.watch(".config/awesome/core/bar/widgets/brightness", 1)
    -- s.layout = awful.widget.watch(".config/awesome/core/bar/widgets/layout", 1)
    -- s.layout:connect_signal("button::press", function()
    --     awful.spawn(".config/awesome/core/bar/widgets/toggle_layout")
    --     s.layout_timer:emit_signal("timeout")
    -- end)

    s.date = awful.widget.watch(".config/awesome/core/bar/widgets/date", 10)
    s.time = awful.widget.watch(".config/awesome/core/bar/widgets/time", 1)
    s.power = awful.widget.watch(".config/awesome/core/bar/widgets/power", 5)
    s.sysstat = awful.widget.watch(".config/awesome/core/bar/widgets/sysstat", 5)

    -- Add widgets to the wibox
    s.mywibox:setup {
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                {
                    {
                        layout = wibox.layout.fixed.horizontal,
                        s.mytaglist,
                        s.mypromptbox,
                    },
                    -- fg = beautiful.pallete.taglist_bg,
                    -- fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background,
                },
                left = dpi(6), -- don't forget to increase wibar height
                widget = wibox.container.margin
            },
            -- s.mytasklist, -- Middle widget
            nil,
            { -- Right widgets
                {

                    layout = wibox.layout.fixed.horizontal,
                    {
                        s.volume,
                        fg = beautiful.pallete.frost1,
                        -- fg = beautiful.titlebar_bg_normal,
                        widget = wibox.container.background,
                    },
                    {
                        s.battery,
                        fg = beautiful.pallete.frost1,
                        -- fg = beautiful.titlebar_bg_normal,
                        widget = wibox.container.background
                    },
                    -- {
                    --     s.layout,
                    --     fg = beautiful.pallete.frost2,
                    --     -- fg = beautiful.titlebar_bg_normal,
                    --     widget = wibox.container.background
                    -- },
                    -- {
                    --     s.wifi,
                    --     fg = beautiful.pallete.frost2,
                    --     -- fg = beautiful.titlebar_bg_normal,
                    --     widget = wibox.container.background
                    -- },
                    {
                        s.power,
                        fg = beautiful.pallete.frost1,
                        -- fg = beautiful.titlebar_bg_normal,
                        widget = wibox.container.background
                    },
                    {
                        s.sysstat,
                        fg = beautiful.pallete.frost2,
                        -- fg = beautiful.titlebar_bg_normal,
                        widget = wibox.container.background
                    },
                    {
                        mytextclock,
                        fg = beautiful.pallete.frost0,
                        -- fg = beautiful.titlebar_bg_normal,
                        widget = wibox.container.background
                    },
                    {
                        s.systray,
                        top = dpi(3),
                        left = dpi(2),
                        right = dpi(3),
                        widget = wibox.container.margin
                    },
                    -- {
                    --     s.mylayoutbox,
                    --     fg = beautiful.pallete.frost0,
                    --     -- fg = beautiful.titlebar_bg_normal,
                    --     widget = wibox.container.background
                    -- },
                },
                right = dpi(3),
                widget = wibox.container.margin
            }
        },
        bottom = dpi(3),
        -- top = dpi(13), -- don't forget to increase wibar height
        -- left = dpi(13), -- don't forget to increase wibar height
        -- right = dpi(13), -- don't forget to increase wibar height
        widget = wibox.container.margin,
        color = "#00000000"
    }
end)
