local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- lazy loading stuff
require('lazy').setup({
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },

    -- whichkey
    { 'folke/which-key.nvim',  opts = {} },

    {
        "nvim-tree/nvim-web-devicons",
        opts = {
            override_by_filename = {
                [".dockerignore"] = {
                    icon = "",
                    name = "DOCKERFILE"
                },
                ["dockerfile"] = {
                    icon = "",
                    name = "DOCKERFILE"
                }
            },
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            renderer = {
                indent_markers = {
                    enable = false,
                    inline_arrows = false,
                },
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            default = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                    show = {
                        folder_arrow = false
                    }
                }
            }
        }
    },

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function (bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function ()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function () gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ 'n', 'v' }, '[c', function ()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function () gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    },

    {
        -- Theme inspired by Atom
        'shaunsingh/nord.nvim',
        config = function ()
            vim.cmd.colorscheme 'nord'
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'nord',
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
                lualine_a = { 'mode' },
                lualine_b = { 'branch', {
                    "diff",
                    source = function ()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end
                    ,
                    symbols = { added = "  ", modified = " ", removed = " " },
                    -- diff_color = {
                    --   added = { fg = colors.green },
                    --   modified = { fg = colors.yellow },
                    --   removed = { fg = colors.red },
                    -- },
                    cond = nil,
                } },
                lualine_c = {
                    'filename',
                },
                -- lualine_d = {require('auto-session-library').current_session_name},
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        cond = function ()
                            return vim.fn.winwidth(0) > 70
                        end,
                    },
                    -- components.treesitter,
                    {
                        function (msg)
                            msg = msg or "LS Inactive"
                            local buf_clients = vim.lsp.get_active_clients()
                            if next(buf_clients) == nil then
                                -- TODO: clean up this if statement
                                if type(msg) == "boolean" or #msg == 0 then
                                    return "nolang"
                                end
                                return msg
                            end
                            local buf_ft = vim.bo.filetype
                            local buf_client_names = {}

                            -- add client
                            for _, client in pairs(buf_clients) do
                                if client.name ~= "null-ls" then
                                    table.insert(buf_client_names, client.name)
                                end
                            end

                            -- add formatter
                            local formatters = require "lvim.lsp.null-ls.formatters"
                            local supported_formatters = formatters.list_registered(buf_ft)
                            vim.list_extend(buf_client_names, supported_formatters)

                            -- add linter
                            local linters = require "lvim.lsp.null-ls.linters"
                            local supported_linters = linters.list_registered(buf_ft)
                            vim.list_extend(buf_client_names, supported_linters)

                            local unique_client_names = vim.fn.uniq(buf_client_names)
                            return "[" .. table.concat(unique_client_names, ", ") .. "]"
                        end,
                        color = { gui = "bold" },
                        cond = function ()
                            return vim.fn.winwidth(0) > 70
                        end,
                    },
                    {
                        "filetype",
                        cond = function ()
                            return vim.fn.winwidth(0) > 70
                        end,
                    },
                },
                -- lualine_x = {'searchcount'},
                lualine_y = { 'progress' },
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
        },
    },

    -- Indentation
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '│',
            show_trailing_blankline_indent = false,
        },
    },

    -- Automatically add pair for brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    -- Diagnostics
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function ()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
}, {})

-- custom configurations
require('plugins/config/telescope')
require('plugins/config/treesitter')
require('plugins/config/lsp')
require('plugins/config/cmp')
