local vim = vim
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require('nord').set()
-- vim.cmd('hi rainbowcol1 ')
--
-- Settings for rainbow-treesitter-bracket
vim.cmd('highlight rainbowcol1 guifg=#81A1C1')
vim.cmd('highlight rainbowcol2 guifg=#8FBCBB')
vim.cmd('highlight rainbowcol3 guifg=#EBCB8B')
vim.cmd('highlight rainbowcol4 guifg=#5E81AC')
vim.cmd('highlight rainbowcol5 guifg=#B48EAD')
vim.cmd('highlight rainbowcol6 guifg=#A3BE8C')
vim.cmd('highlight rainbowcol7 guifg=#88C0D0')

vim.cmd('highlight lualine_scrollbar guifg=#D8DEE9 guibg=#3B4252')

vim.cmd('highlight NvimTreeFolderIcon guifg=#81A1C1')

local nord0 = "#2E3440"

require'bufferline'.setup {
    highlights = {
        fill = {
            fg = nord0,
            bg = nord0
        },
        buffer_selected = {
            bold = false,
            italic = false,
        },
        separator_selected = {
            fg = '#232832',
        },
        separator_visible = {
            fg = '#232832',
        },
       separator = {
            fg = '#232832',
        },
    };
}
