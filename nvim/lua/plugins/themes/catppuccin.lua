require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    -- no_italic = false, -- Force no italic
    -- no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "catppuccin-frappe"
	-- #f2d5cf
	-- #eebebe	
	-- #f4b8e4	
	-- #ca9ee6	
	-- #e78284	
	-- #ea999c	
	-- #ef9f76	
	-- #e5c890	
	-- #a6d189	
	-- #81c8be	
	-- #99d1db	
	-- #85c1dc	
	-- #8caaee	
	-- #babbf1	
	-- #c6d0f5	
	-- #b5bfe2	
	-- #a5adce	
	-- #949cbb	
	-- #838ba7	
	-- #737994	
	-- #626880	
	-- #51576d	
	-- #414559	
	-- #303446	
	-- #292c3c	
	-- #232634	

vim.cmd('highlight rainbowcol1 guifg=#f2d5cf')
vim.cmd('highlight rainbowcol2 guifg=#eebebe')
vim.cmd('highlight rainbowcol3 guifg=#f4b8e4')
vim.cmd('highlight rainbowcol4 guifg=#ca9ee6')
vim.cmd('highlight rainbowcol5 guifg=#e78284')
vim.cmd('highlight rainbowcol6 guifg=#ea999c')
vim.cmd('highlight rainbowcol7 guifg=#8caaee')

vim.cmd('highlight lualine_scrollbar guifg=#babbf1 guibg=#292c3c')

vim.cmd('highlight NvimTreeFolderIcon guifg=#8caaee')
