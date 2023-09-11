require('telescope').setup {
  defaults = {
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
