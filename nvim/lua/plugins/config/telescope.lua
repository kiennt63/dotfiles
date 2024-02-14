require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
            i = {
                ['<c-u>'] = false,
                ['<c-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'harpoon')
pcall(require('telescope').load_extension, 'live_grep_args')
