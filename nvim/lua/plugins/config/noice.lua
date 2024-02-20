require('notify').setup({
    background_colour = '#ffffff'
})

require('noice').setup({
    cmdline = {
        enabled = true,
    },
    lsp = {
        progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type NoiceFormat|string
            format = 'lsp_progress',
            --- @type NoiceFormat|string
            format_done = 'lsp_progress_done',
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = 'mini',
        },
        override = {
            -- override the default lsp markdown formatter with Noice
            ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
            -- override the lsp markdown formatter with Noice
            ['vim.lsp.util.stylize_markdown'] = false,
            -- override cmp documentation with Noice (needs the other options to work)
            ['cmp.entry.get_documentation'] = false,
        }
    },
})
