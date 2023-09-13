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
        "NvChad/nvim-colorizer.lua"
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    },

    -- session manager
    {
        'rmagatti/auto-session',
        opts = {
            log_level = "error",
            cwd_change_handling = {
                restore_upcoming_session = true,    -- already the default, no need to specify like this, only here as an example
                pre_cwd_changed_hook = nil,         -- already the default, no need to specify like this, only here as an example
                post_cwd_changed_hook = function () -- example refreshing the lualine status line _after_ the cwd changes
                    require("lualine").refresh()    -- refresh lualine so the new session name is displayed in the status bar
                end,
            },
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

    -- Theme inspired by Atom
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
        -- opts = {
        --     options = {
        --         icons_enabled = true,
        --         theme = 'nord',
        --         section_separators = { left = '', right = '' },
        --         component_separators = { left = '', right = '' },
        --         -- component_separators = { left = '', right = ''},
        --         -- section_separators = { left = '', right = ''},
        --         -- component_separators = { left = '', right = '' },
        --         -- section_separators = { left = '', right = '' },
        --         disabled_filetypes = {
        --             statusline = {},
        --             winbar = {},
        --         },
        --         ignore_focus = { 'NvimTree' },
        --         always_divide_middle = true,
        --         globalstatus = true,
        --         refresh = {
        --             statusline = 1000,
        --             tabline = 1000,
        --             winbar = 1000,
        --         }
        --     },
        --     sections = {
        --         lualine_a = {
        --             {
        --                 'mode',
        --                 icons_enabled = true,
        --                 separator = { left = '', right = '' },
        --                 right_padding = 2
        --             },
        --         },
        --         lualine_b = { 'branch', {
        --             "diff",
        --             source = function ()
        --                 local gitsigns = vim.b.gitsigns_status_dict
        --                 if gitsigns then
        --                     return {
        --                         added = gitsigns.added,
        --                         modified = gitsigns.changed,
        --                         removed = gitsigns.removed,
        --                     }
        --                 end
        --             end
        --             ,
        --             symbols = { added = "  ", modified = " ", removed = " " },
        --             -- diff_color = {
        --             --   added = { fg = colors.green },
        --             --   modified = { fg = colors.yellow },
        --             --   removed = { fg = colors.red },
        --             -- },
        --             cond = nil,
        --         } },
        --         lualine_c = {
        --             'filename',
        --         },
        --         -- lualine_d = {require('auto-session-library').current_session_name},
        --         lualine_x = {
        --             {
        --                 "diagnostics",
        --                 sources = { "nvim_diagnostic" },
        --                 symbols = { error = " ", warn = " ", info = " ", hint = " " },
        --                 cond = function ()
        --                     return vim.fn.winwidth(0) > 70
        --                 end,
        --             },
        --             -- components.treesitter,
        --             {
        --                 function (msg)
        --                     msg = msg or "LS Inactive"
        --                     local buf_clients = vim.lsp.get_active_clients()
        --                     if next(buf_clients) == nil then
        --                         -- TODO: clean up this if statement
        --                         if type(msg) == "boolean" or #msg == 0 then
        --                             return "nolang"
        --                         end
        --                         return msg
        --                     end
        --                     local buf_ft = vim.bo.filetype
        --                     local buf_client_names = {}
        --
        --                     -- add client
        --                     for _, client in pairs(buf_clients) do
        --                         if client.name ~= "null-ls" then
        --                             table.insert(buf_client_names, client.name)
        --                         end
        --                     end
        --
        --                     -- add formatter
        --                     local formatters = require "lvim.lsp.null-ls.formatters"
        --                     local supported_formatters = formatters.list_registered(buf_ft)
        --                     vim.list_extend(buf_client_names, supported_formatters)
        --
        --                     -- add linter
        --                     local linters = require "lvim.lsp.null-ls.linters"
        --                     local supported_linters = linters.list_registered(buf_ft)
        --                     vim.list_extend(buf_client_names, supported_linters)
        --
        --                     local unique_client_names = vim.fn.uniq(buf_client_names)
        --                     return "[" .. table.concat(unique_client_names, ", ") .. "]"
        --                 end,
        --                 color = { gui = "bold" },
        --                 cond = function ()
        --                     return vim.fn.winwidth(0) > 70
        --                 end,
        --             },
        --             {
        --                 "filetype",
        --                 cond = function ()
        --                     return vim.fn.winwidth(0) > 70
        --                 end,
        --             },
        --         },
        --         -- lualine_x = {'searchcount'},
        --         lualine_y = { 'progress' },
        --         lualine_z = { { 'location', separator = { left = '', right = '' }, left_padding = 2 } }
        --     },
        --     inactive_sections = {
        --         lualine_a = {},
        --         lualine_b = {},
        --         lualine_c = { 'filename' },
        --         lualine_x = { 'location' },
        --         lualine_y = {},
        --         lualine_z = {}
        --     },
        --     tabline = {},
        --     winbar = {},
        --     inactive_winbar = {},
        --     extensions = {}
        -- },
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

    -- Add tabs
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' },
        -- opts = {
        --     options = {
        --         numbers = "none",                             -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        --         close_command = "Bdelete! %d",                -- can be a string | function, see "Mouse actions"
        --         middle_mouse_command = "Bdelete! %d",         -- can be a string | function, see "Mouse actions"
        --         left_mouse_command = "buffer %d",             -- can be a string | function, see "Mouse actions"
        --         right_mouse_command = ":BufferLineTogglePin", -- can be a string | function, see "Mouse actions"
        --         -- NOTE: this plugin is designed with this icon in mind,
        --         -- and so changing this is NOT recommended, this is intended
        --         -- as an escape hatch for people who cannot bear it for whatever reason
        --         indicator = {
        --             icon = '▎', -- this should be omitted if indicator style is not 'icon'
        --             style = 'icon',
        --         },
        --         buffer_close_icon = "",
        --         -- buffer_close_icon = '',
        --         modified_icon = "●",
        --         close_icon = "",
        --         -- close_icon = '',
        --         left_trunc_marker = "",
        --         right_trunc_marker = "",
        --         --- name_formatter can be used to change the buffer's label in the bufferline.
        --         --- Please note some names can/will break the
        --         --- bufferline so use this at your discretion knowing that it has
        --         --- some limitations that will *NOT* be fixed.
        --         -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        --         --   -- remove extension from markdown files for example
        --         --   if buf.name:match('%.md') then
        --         --     return vim.fn.fnamemodify(buf.name, ':t:r')
        --         --   end
        --         -- end,
        --         max_name_length = 30,
        --         max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        --         tab_size = 18,
        --         diagnostics = false,    -- | "nvim_lsp" | "coc",
        --         diagnostics_update_in_insert = false,
        --         -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --         --   return "("..count..")"
        --         -- end,
        --         -- NOTE: this will be called a lot so don't do any heavy processing here
        --         -- custom_filter = function(buf_number)
        --         --   -- filter out filetypes you don't want to see
        --         --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --         --     return true
        --         --   end
        --         --   -- filter out by buffer name --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --         --     return true
        --         --   end
        --         --   -- filter out based on arbitrary rules
        --         --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --         --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --         --     return true
        --         --   end
        --         -- end,
        --         offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        --         show_buffer_icons = true,
        --         show_buffer_close_icons = true,
        --         show_close_icon = false,
        --         show_tab_indicators = false,
        --         persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        --         -- can also be a table containing 2 custom separators
        --         -- [focused and unfocused]. eg: { '|', '|' }
        --         separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        --         enforce_regular_tabs = true,
        --         always_show_bufferline = true,
        --         sort_by = 'id', -- | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --     },
        --     highlights = {
        --         fill = {
        --             fg = '#2E3440',
        --             bg = '#2E3440'
        --         },
        --         buffer_selected = {
        --             bold = false,
        --             italic = false,
        --         },
        --         separator_selected = {
        --             fg = '#2E3440',
        --         },
        --         separator_visible = {
        --             fg = '#2E3440',
        --         },
        --         separator = {
        --             fg = '#2E3440',
        --         },
        --     };
        -- }
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
require('plugins/config/lualine')
require('plugins/config/nvim-tree')
require('plugins/config/bufferline')
