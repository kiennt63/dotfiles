local vim = vim
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require('nord').set()
-- vim.cmd('hi rainbowcol1 ')
--
-- Settings for rainbow-treesitter-bracket
vim.cmd('highlight rainbowcol1 guifg=#81A1C1')
vim.cmd('highlight rainbowcol2 guifg=#A3BE8C')
vim.cmd('highlight rainbowcol3 guifg=#EBCB8B')
vim.cmd('highlight rainbowcol4 guifg=#5E81AC')
vim.cmd('highlight rainbowcol5 guifg=#B48EAD')
vim.cmd('highlight rainbowcol6 guifg=#8FBCBB')
vim.cmd('highlight rainbowcol7 guifg=#88C0D0')

local nord0 = "#2E3440"
local nord1 = "#3B4252"
local nord2 = "#434C5E"
local nord9 = "#81A1C1"
-- local fill = nord0 --'#181c24' if separator_style is "slant"
-- local indicator = nord9
-- local bg = nord0
-- local buffer_bg = nord1
-- local buffer_bg_selected = nord2
-- local buffer_bg_visible = "#2A2F3A"

require'bufferline'.setup{
    highlights = {
        fill = {
            fg = nord0,
            bg = nord0
        },
        -- background = {
        --     bg = '#434C5E'
        -- },
        -- tab = {
        --     fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        -- tab_selected = {
        --     fg = tabline_sel_bg,
        --     bg = '#ffffff'
        -- },
        -- tab_close = {
        --     fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        -- close_button = {
        --     fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        -- close_button_visible = {
        --     -- fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        -- -- close_button_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- buffer_visible = {
        --     -- fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        buffer_selected = {
            bold = false,
            italic = false,
        },
        -- -- numbers = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- -- },
        -- -- numbers_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- -- },
        -- -- numbers_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- diagnostic = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- -- },
        -- -- diagnostic_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- -- },
        -- -- diagnostic_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- hint = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- hint_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- hint_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- hint_diagnostic = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- hint_diagnostic_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- hint_diagnostic_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- info = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- info_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- info_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- info_diagnostic = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- info_diagnostic_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- info_diagnostic_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- warning = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- warning_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- warning_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- warning_diagnostic = {
        -- --     fg = '#ff0000',
        -- --     sp = '<colour-value-here>',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- warning_diagnostic_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- warning_diagnostic_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = warning_diagnostic_fg
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- error = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- -- },
        -- -- error_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- error_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- error_diagnostic = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- -- },
        -- -- error_diagnostic_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- error_diagnostic_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     sp = '<colour-value-here>'
        -- --     bold = true,
        -- --     italic = true,
        -- -- },
        -- -- modified = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- modified_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- modified_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff'
        -- -- },
        -- -- duplicate_selected = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     italic = true,
        -- -- },
        -- -- duplicate_visible = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     italic = true
        -- -- },
        -- -- duplicate = {
        -- --     fg = '#ff0000',
        -- --     bg = '#ffffff',
        -- --     italic = true
        -- -- },
        separator_selected = {
            fg = '#232832',
        },
        separator_visible = {
            fg = '#232832',
        },
        separator = {
            fg = '#232832',
        },
        -- indicator_selected = {
        --     fg = '#ff0000',
        --     bg = '#ffffff'
        -- },
        -- pick_selected = {
        --     fg = '#ff0000',
        --     bg = '#ffffff',
        --     bold = true,
        --     italic = true,
        -- },
        -- pick_visible = {
        --     fg = '#ff0000',
        --     bg = '#ffffff',
        --     bold = true,
        --     italic = true,
        -- },
        -- pick = {
        --     fg = '#ff0000',
        --     bg = '#ffffff',
        --     bold = true,
        --     italic = true,
        -- },
        -- offset_separator = {
        --     fg = win_separator_fg,
        --     bg = separator_background_color,
        -- },
    };
}
