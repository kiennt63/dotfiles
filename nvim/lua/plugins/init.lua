local fn = vim.fn
local packer = require('packer')

-- Automatically install packer and sync when save file
-- require('plugins/autosync')


-- Have packer use a popup window
local util = require('packer.util')
packer.init({
    display = {
        open_fn = function()
            return util.float({ border = "rounded" })
        end,
    },
    compile_path = util.join_paths(fn.stdpath('data'), 'plugin', 'packer_compiled.lua'),
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here

    -- Self manage
    use "wbthomason/packer.nvim"

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Formatter
    use "lukas-reineke/lsp-format.nvim"


    -- Toggle term
    use {
        "akinsho/toggleterm.nvim",
        tag = '*'
    }

    -- Autosave
    use {
        "Pocco81/auto-save.nvim"
    }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
    }

    -- Markdown preview
    use { "ellisonleao/glow.nvim" }

    -- Git diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Lualine
    use "nvim-lualine/lualine.nvim"
    -- Bufferline
    -- use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    use 'moll/vim-bbye'

    -- Session
    use 'rmagatti/auto-session'
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- nvim-tree
    use "kyazdani42/nvim-tree.lua"

    -- File explorer
    -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    --
    -- use {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --     }
    -- }

    -- File explorer
    use {
        "kevinhwang91/rnvimr",
        updater = nil
    }
    -- Autopair
    use "windwp/nvim-autopairs"
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild \
               -DCMAKE_BUILD_TYPE=Release && \
               cmake --build build --config Release && \
               cmake --install build --prefix build'
    }
    -- Gitsigns
    use {
        'lewis6991/gitsigns.nvim',
    }
    -- Colorschemes
    use 'shaunsingh/nord.nvim'
    use 'sainnhe/gruvbox-material'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Show colors
    use 'NvChad/nvim-colorizer.lua'

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- Function signatures
    use "ray-x/lsp_signature.nvim"

    -- Scrollbar
    use 'petertriho/nvim-scrollbar'

    -- Whichkey
    use "folke/which-key.nvim"

    -- Remote
    use {
        'chipsenkbeil/distant.nvim',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end
    }

    -- Other
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-abolish"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

    if vim.g.vscode then
        require 'colorizer'.setup {}
        require('nvim-surround').setup {}
        require('Comment').setup()
    else
        require 'plugins/themes'
        require 'plugins/autopairs'
        require 'plugins/autosave'
        require 'plugins/lualine'
        require 'plugins/bufferline'
        require 'plugins/cmp'
        require 'plugins/lsp-signature'
        require 'plugins/telescope'
        -- require('telescope').load_extension('media_files')
        require 'plugins/devicons'
        require 'plugins/nvim-tree'
        -- require 'plugins/neotree'
        require 'plugins/treesitter'
        require 'plugins/toggleterm'
        require 'plugins/autosession'
        -- require 'plugins/wk'
        -- require 'plugins/scrollbar'

        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "rust_analyzer" }
        }
        require('gitsigns').setup()
        require 'colorizer'.setup {}
        require('nvim-surround').setup {}
        require('Comment').setup()
        require('plugins/lsp')
        require('impatient')
        require('plugins/snippet')
        require('plugins/markdown')
    end
end)
