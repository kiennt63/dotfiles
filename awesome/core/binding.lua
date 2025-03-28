local gears         = require("gears")
local awful         = require("awful")
local apps          = require("core.apps")
-- {{{ Mouse bindings

-- local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- root.buttons(gears.table.join(
--     awful.button({}, 3, function() mymainmenu:toggle() end),
--     awful.button({}, 4, awful.tag.viewnext),
--     awful.button({}, 5, awful.tag.viewprev)
-- ))
-- }}}

modkey = "Mod4"

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey, }, "s", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
    -- awful.key({ modkey, }, "Left", awful.tag.viewprev,
    --     { description = "view previous", group = "tag" }),
    -- awful.key({ modkey, }, "Right", awful.tag.viewnext,
    --     { description = "view next", group = "tag" }),
    -- awful.key({ modkey, }, "Escape", awful.tag.history.restore,
    --     { description = "go back", group = "tag" }),

    awful.key({ modkey, }, "j",
        function()
            awful.client.focus.byidx(1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey, }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "client" }
    ),
    -- awful.key({ modkey, }, "w", function() mymainmenu:show() end,
    --     { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Control", "Shift" }, "x", awesome.quit,
        { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Launcher
    awful.key({ modkey }, "r", function() awful.spawn(apps.rofi_drun, false) end,
        { description = "run rofi drun", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "r", function() awful.spawn(apps.rofi_run, false) end,
        { description = "run rofi run", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "w", function() awful.spawn(apps.rofi_window, false) end,
        { description = "run rofi window", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "e", function() awful.spawn.with_shell(apps.rofi_calc, false) end,
        { description = "run rofi calc", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "p", function() awful.spawn.with_shell(apps.rofi_power_menu, false) end,
        { description = "run rofi power menu", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "y", function() awful.spawn.with_shell(apps.rofi_gpaste, false) end,
        { description = "run rofi clipboard", group = "launcher" }),
    awful.key({ modkey, }, "e", function() awful.spawn.with_shell(apps.clickup, false) end,
        { description = "run clickup", group = "launcher" }),
    awful.key({ modkey, }, "g", function() awful.spawn.with_shell(apps.godot, false) end,
        { description = "open godot", group = "launcher" }),
    awful.key({ modkey, }, "Return", function() awful.spawn(apps.terminal, false) end,
        { description = "open terminal", group = "launcher" }),
    awful.key({ modkey, }, "w", function() awful.spawn(apps.browser, false) end,
        { description = "open browser", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "q", function() awful.spawn.with_shell(apps.files, false) end,
        { description = "open ranger", group = "launcher" }),
    awful.key({ modkey, }, "q", function() awful.spawn.with_shell(apps.fman, false) end,
        { description = "open files", group = "launcher" }),

    -- Media control
    awful.key({}, "XF86AudioPlay", function() awful.util.spawn("playerctl --player=cider play-pause") end),
    awful.key({}, "XF86AudioNext", function() awful.util.spawn("playerctl --player=cider next") end),
    awful.key({}, "XF86AudioPrev", function() awful.util.spawn("playerctl --player=cider previous") end),
    awful.key({}, "XF86AudioRaiseVolume", function() awful.util.spawn("pamixer -i 5 --allow-boost --set-limit 150") end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.util.spawn("pamixer -d 5 --allow-boost --set-limit 150") end),
    awful.key({}, "XF86AudioMute", function() awful.util.spawn("pamixer -t") end),


    -- Screenshot

    awful.key({ modkey, "Shift" }, "s",
        function() awful.spawn.with_shell("sh ~/dotfiles/awesome/scripts/screenshot_copy.sh") end,
        { description = "copy screenshot selection", group = "launcher" }),
    awful.key({ modkey, "Control", "Shift" }, "s",
        function() awful.spawn.with_shell("sh ~/dotfiles/awesome/scripts/screenshot_save.sh") end,
        { description = "save screenshot selection", group = "launcher" })

)

clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        client.focus = c; c:raise()
    end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}
