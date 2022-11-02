local components = require('plugins/lualine/components')
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = { 'NvimTree' },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', components.diff },
        lualine_c = {
            'filename',
        },
        -- lualine_d = {require('auto-session-library').current_session_name},
        lualine_x = {
            components.diagnostics,
            -- components.treesitter,
            components.lsp,
            components.filetype,
        },
        -- lualine_x = {'searchcount'},
        lualine_y = { components.scrollbar },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
