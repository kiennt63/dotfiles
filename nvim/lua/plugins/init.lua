local fn = vim.fn
local packer = require('packer')

-- Automatically install packer and sync when save file
require('plugins/autosync')


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

    -- Toggle term
    use {
        "akinsho/toggleterm.nvim",
        tag = '*'
    }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
    }

    -- Lualine
    use "nvim-lualine/lualine.nvim"
    -- Bufferline
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'moll/vim-bbye'
    -- Other
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "goolord/alpha-nvim"
    use "folke/which-key.nvim"

    -- Session
    use 'rmagatti/auto-session'
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use 'p00f/nvim-ts-rainbow'

    -- nvim-tree
    use "kyazdani42/nvim-tree.lua"

    -- File explorer
    use {
        "kevinhwang91/rnvimr",
        updater = nil
    }
    -- use {
    --     "luukvbaal/nnn.nvim",
    -- }


    -- Autopair
    use "windwp/nvim-autopairs"

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
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Gitsigns
    use {
        'lewis6991/gitsigns.nvim',
    }
    -- Colorschemes
    use 'shaunsingh/nord.nvim'

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
    use 'lewis6991/satellite.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

    require 'plugins/nord'
    require 'plugins/autopairs'
    require 'plugins/lualine'
    require 'plugins/bufferline'
    require 'plugins/cmp'
    require 'plugins/lsp-signature'
    require 'plugins/telescope'
    require('telescope').load_extension('media_files')
    require 'plugins/nvim-tree'
    require 'plugins/treesitter'
    require 'plugins/toggleterm'
    require 'plugins/autosession'
    require 'plugins/wk'
    require 'plugins/scrollbar'

    -- require("nnn").setup()

    require("mason").setup {}
    require("mason-lspconfig").setup {
        ensure_installed = { "sumneko_lua", "rust_analyzer" }
    }
    require('gitsigns').setup {}
    require 'colorizer'.setup {}
    require('Comment').setup()
    require('plugins/lsp')

end)
