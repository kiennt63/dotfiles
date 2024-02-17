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
        'p00f/clangd_extensions.nvim',
        lazy = true,
        config = function () end,
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                --These require codicons (https://github.com/microsoft/vscode-codicons)
                role_icons = {
                    type = '',
                    declaration = '',
                    expression = '',
                    specifier = '',
                    statement = '',
                    ['template argument'] = '',
                },
                kind_icons = {
                    Compound = '',
                    Recovery = '',
                    TranslationUnit = '',
                    PackExpansion = '',
                    TemplateTypeParm = '',
                    TemplateTemplateParm = '',
                    TemplateParamObject = '',
                },
            },
        },
    },

    -- {
    --     'ray-x/lsp_signature.nvim',
    --     -- event = 'VeryLazy',
    --     -- opts = {
    --     --     log_path = vim.fn.expand('$HOME') .. '/tmp/sig.log',
    --     --     debug = true,
    --     --     hint_enable = false,
    --     --     handler_opts = { border = 'rounded' },
    --     --     max_width = 30,
    --     -- },
    --     -- config = function (_, opts) require 'lsp_signature'.setup(opts) end
    -- },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'rafamadriz/friendly-snippets',
        },
    },

    -- {
    --     'iamcco/markdown-preview.nvim',
    --     config = function () vim.fn['mkdp#util#install']() end,
    -- },

    -- whichkey
    { 'folke/which-key.nvim',  opts = {} },

    {
        'nvim-tree/nvim-web-devicons',
        opts = {
            override_by_filename = {
                ['.dockerignore'] = {
                    icon = '',
                    name = 'DOCKERFILE'
                },
                ['dockerfile'] = {
                    icon = '',
                    name = 'DOCKERFILE'
                }
            },
        },
    },

    {
        'NvChad/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup({})
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        pin = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },

    -- {
    --     'nvim-neo-tree/neo-tree.nvim',
    --     branch = 'v3.x',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    --         'MunifTanjim/nui.nvim',
    --     }
    -- },

    -- Startpage
    -- {
    --     'mhinz/vim-startify',
    -- },

    -- session manager
    {
        'rmagatti/auto-session',
        opts = {
            log_level = 'error',
            cwd_change_handling = {
                post_cwd_changed_hook = function () -- example refreshing the lualine status line _after_ the cwd changes
                    require('lualine').refresh()    -- refresh lualine so the new session name is displayed in the status bar
                end,
                post_restore_cmds = {
                    -- function ()
                    --     local nvim_tree = require('nvim-tree')
                    --     nvim_tree.change_dir(vim.fn.getcwd())
                    -- end,
                    -- 'NvimTreeOpen'
                }
            },
        }
    },
    -- {
    --     "folke/persistence.nvim",
    --     event = "BufReadPre",                          -- this will only start session saving when an actual file was opened
    --     opts = {
    --         dir = vim.fn.stdpath('data') .. '/session/' -- add any custom options here
    --     }
    -- },

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
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function ()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function () gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },

    -- Theme inspired by Atom
    {
        -- Theme inspired by Atom
        'shaunsingh/nord.nvim',
        --     config = function ()
        --         vim.cmd.colorscheme 'nord'
        --     end,
    },

    {
        'kiennt63/gruvbox-material',
        -- config = function ()
        --     vim.cmd.colorscheme 'gruvbox-material'
        -- end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
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
        event = 'InsertEnter',
        opts = {}
    },

    -- Diagnostics
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            position = 'right'
        },
    },

    -- Add tabs
    -- {
    --     'akinsho/bufferline.nvim',
    --     version = '*',
    --     dependencies = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' },
    -- },

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim', 'moll/vim-bbye' },
        opts = {
            menu = {
                width = math.floor(vim.api.nvim_win_get_width(0) / 2),
            }
        }
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
        lazy = true,
        pin = true,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        'nvim-treesitter/nvim-treesitter-context'
    }
}, {})


-- custom configurations
require('plugins/config/telescope')
require('plugins/config/treesitter')
require('plugins/config/lsp')
require('plugins/config/cmp')
require('plugins/config/lualine')
require('plugins/config/nvim-tree')
-- require('plugins/config/neotree')
-- require('plugins/config/bufferline')
require('plugins/config/snippet')
require('plugins/config/theme')
require('plugins/config/startify')
