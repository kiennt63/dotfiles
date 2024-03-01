local separator_glyphs = require('plugins/config/lualine/separator')

require('lsp-progress').setup({
    client_format = function (client_name, spinner, series_messages)
        if #series_messages == 0 then
            return nil
        end
        return {
            name = client_name,
            body = spinner .. ' ' .. table.concat(series_messages, ', '),
        }
    end,
    format = function (client_messages)
        --- @param name string
        --- @param msg string?
        --- @return string
        local function stringify(name, msg)
            return msg and string.format('%s %s', name, msg) or name
        end

        local sign = '' -- nf-fa-gear \uf013
        local lsp_clients = vim.lsp.get_active_clients()
        local messages_map = {}
        for _, climsg in ipairs(client_messages) do
            messages_map[climsg.name] = climsg.body
        end

        if #lsp_clients > 0 then
            table.sort(lsp_clients, function (a, b)
                return a.name < b.name
            end)
            local builder = {}
            for _, cli in ipairs(lsp_clients) do
                if
                    type(cli) == 'table'
                    and type(cli.name) == 'string'
                    and string.len(cli.name) > 0
                then
                    if messages_map[cli.name] then
                        table.insert(builder, stringify(cli.name, messages_map[cli.name]))
                    else
                        table.insert(builder, stringify(cli.name))
                    end
                end
            end
            if #builder > 0 then
                return sign .. ' ' .. table.concat(builder, ', ')
            end
        end
        return ''
    end,
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = separator_glyphs.close, right = separator_glyphs.open },
        component_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'alpha',
            statusline = {},
            winbar = {},
        },
        ignore_focus = { 'NvimTree', 'alpha' },
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
                'filename',
                icons_enabled = true,
                separator = { left = separator_glyphs.open, right = separator_glyphs.close },
                right_padding = 0,
                symbols = {
                    modified = '●'
                }
            },
        },
        lualine_b = {
            { 'branch', icon = { ''}},
            {
                'diff',
                source = function ()
                    ---@diagnostic disable-next-line: undefined-field
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed,
                        }
                    end
                end,
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                cond = nil,
            }
        },
        lualine_c = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                cond = function ()
                    return vim.fn.winwidth(0) > 70
                end,
            },
            require('lsp-progress').progress,
        },
        -- lualine_d = {require('auto-session-library').current_session_name},
        lualine_x = {
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
        lualine_z = {
            { 'location', separator = { left = separator_glyphs.open, right = separator_glyphs.close }, left_padding = 0 } }
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
