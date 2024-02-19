-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Cursor
config.cursor_blink_rate = 0
config.cursor_thickness = 2

-- Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

-- Font
config.color_scheme = 'nord'
config.font = wezterm.font('LigaSauceCodePro NF')
config.font_size = 15
config.line_height = 1.0
config.adjust_window_size_when_changing_font_size = false

-- Keybinding
-- config.send_composed_key_when_right_alt_is_pressed = true
-- config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
        key = '1',
        mods = 'CMD',
        action = act.SendKey {
            key = '1',
            mods = 'ALT',
        },
    },
    {
        key = '2',
        mods = 'CMD',
        action = act.SendKey {
            key = '2',
            mods = 'ALT'
        },
    },
    {
        key = '3',
        mods = 'CMD',
        action = act.SendKey {
            key = '3',
            mods = 'ALT'
        },
    },
    {
        key = '4',
        mods = 'CMD',
        action = act.SendKey {
            key = '4',
            mods = 'ALT'
        },
    },
    {
        key = '5',
        mods = 'CMD',
        action = act.SendKey {
            key = '5',
            mods = 'ALT'
        },
    },
    {
        key = '6',
        mods = 'CMD',
        action = act.SendKey {
            key = '6',
            mods = 'ALT'
        },
    },
    {
        key = '7',
        mods = 'CMD',
        action = act.SendKey {
            key = '7',
            mods = 'ALT'
        },
    },
    {
        key = '8',
        mods = 'CMD',
        action = act.SendKey {
            key = '8',
            mods = 'ALT'
        },
    },
    {
        key = '9',
        mods = 'CMD',
        action = act.SendKey {
            key = '9',
            mods = 'ALT'
        },
    },
    {
        key = '0',
        mods = 'CMD',
        action = act.SendKey {
            key = '0',
            mods = 'ALT'
        },
    },
    {
        key = 'j',
        mods = 'CMD',
        action = act.SendKey {
            key = 'j',
            mods = 'ALT'
        },
    },
    {
        key = 'k',
        mods = 'CMD',
        action = act.SendKey {
            key = 'k',
            mods = 'ALT'
        },
    },
    {
        key = 'l',
        mods = 'CMD',
        action = act.SendKey {
            key = 'l',
            mods = 'ALT'
        },
    },
    {
        key = 'h',
        mods = 'CMD',
        action = act.SendKey {
            key = 'h',
            mods = 'ALT'
        },
    },
    {
        key = 'j',
        mods = 'CMD|CTRL',
        action = act.SendKey {
            key = 'j',
            mods = 'ALT|CTRL'
        },
    },
    {
        key = 'k',
        mods = 'CMD|CTRL',
        action = act.SendKey {
            key = 'k',
            mods = 'ALT|CTRL'
        },
    },
    {
        key = 'l',
        mods = 'CMD|CTRL',
        action = act.SendKey {
            key = 'l',
            mods = 'ALT|CTRL'
        },
    },
    {
        key = 'h',
        mods = 'CMD|CTRL',
        action = act.SendKey {
            key = 'h',
            mods = 'ALT|CTRL'
        },
    },
    {
        key = 'j',
        mods = 'CMD|SHIFT',
        action = act.SendKey {
            key = 'j',
            mods = 'ALT|SHIFT'
        },
    },
    {
        key = 'k',
        mods = 'CMD|SHIFT',
        action = act.SendKey {
            key = 'k',
            mods = 'ALT|SHIFT'
        },
    },
    {
        key = 'l',
        mods = 'CMD|SHIFT',
        action = act.SendKey {
            key = 'l',
            mods = 'ALT|SHIFT'
        },
    },
    {
        key = 'h',
        mods = 'CMD|SHIFT',
        action = act.SendKey {
            key = 'h',
            mods = 'ALT|SHIFT'
        },
    },
}

return config
