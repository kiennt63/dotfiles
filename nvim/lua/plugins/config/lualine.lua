require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
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
        lualine_a = {
            {
                'mode',
                icons_enabled = true,
                separator = { left = '', right = '' },
                right_padding = 0
            },
        },
        lualine_b = {
            'branch',
            {
                'diff',
                source = function ()
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed,
                        }
                    end
                end,
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                cond = nil,
            }
        },
        lualine_c = {
            'filename',
        },
        -- lualine_d = {require('auto-session-library').current_session_name},
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                cond = function ()
                    return vim.fn.winwidth(0) > 70
                end,
            },
            -- components.treesitter,
            {
                function (msg)
                    msg = msg or 'LS Inactive'
                    local buf_clients = vim.lsp.get_active_clients()
                    if next(buf_clients) == nil then
                        -- TODO: clean up this if statement
                        if type(msg) == 'boolean' or #msg == 0 then
                            return 'nolang'
                        end
                        return msg
                    end
                    local buf_ft = vim.bo.filetype
                    local buf_client_names = {}

                    -- add client
                    for _, client in pairs(buf_clients) do
                        if client.name ~= 'null-ls' then
                            table.insert(buf_client_names, client.name)
                        end
                    end

                    -- add formatter
                    local formatters = require 'lvim.lsp.null-ls.formatters'
                    local supported_formatters = formatters.list_registered(buf_ft)
                    vim.list_extend(buf_client_names, supported_formatters)

                    -- add linter
                    local linters = require 'lvim.lsp.null-ls.linters'
                    local supported_linters = linters.list_registered(buf_ft)
                    vim.list_extend(buf_client_names, supported_linters)

                    local unique_client_names = vim.fn.uniq(buf_client_names)
                    return '[' .. table.concat(unique_client_names, ', ') .. ']'
                end,
                color = { gui = 'bold' },
                cond = function ()
                    return vim.fn.winwidth(0) > 70
                end,
            },
            {
                'filetype',
                cond = function ()
                    return vim.fn.winwidth(0) > 70
                end,
            },
        },
        -- lualine_x = {'searchcount'},
        lualine_y = { 'progress' },
        lualine_z = { { 'location', separator = { left = '', right = '' }, left_padding = 0 } }
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
