require("catppuccin").setup {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
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
}

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "catppuccin-mocha"
 -- #f5e0dc
 -- #f2cdcd
 -- #f5c2e7
 -- #cba6f7
 -- #f38ba8
 -- #eba0ac
 -- #fab387
 -- #f9e2af
 -- #a6e3a1
 -- #94e2d5
 -- #89dceb
 -- #74c7ec
 -- #89b4fa
 -- #b4befe
 -- #cdd6f4
 -- #bac2de
 -- #a6adc8
 -- #9399b2
 -- #7f849c
 -- #6c7086
 -- #585b70
 -- #45475a
 -- #313244
 -- #1e1e2e
 -- #181825
 -- #11111b

vim.cmd('highlight rainbowcol1 guifg=#f5e0dc')
vim.cmd('highlight rainbowcol2 guifg=#f2cdcd')
vim.cmd('highlight rainbowcol3 guifg=#f5c2e7')
vim.cmd('highlight rainbowcol4 guifg=#cba6f7')
vim.cmd('highlight rainbowcol5 guifg=#f38ba8')
vim.cmd('highlight rainbowcol6 guifg=#eba0ac')
vim.cmd('highlight rainbowcol7 guifg=#89b4fa')

vim.cmd('highlight lualine_scrollbar guifg=#b4befe guibg=#1e1e2e')

vim.cmd('highlight NvimTreeFolderIcon guifg=#89b4fa')
