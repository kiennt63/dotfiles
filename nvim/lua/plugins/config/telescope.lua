vim.api.nvim_create_autocmd('FileType', {
    pattern = 'TelescopeResults',
    callback = function (ctx)
        vim.api.nvim_buf_call(ctx.buf, function ()
            vim.fn.matchadd('TelescopeParent', '\t\t.*$')
            vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
        end)
    end,
})

local function filename_first(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == '.' then return tail end
    return string.format('%s\t\t%s', tail, parent)
end


require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true,
            path_display = filename_first,
        },
        live_grep = {
            hidden = true,
            path_display = filename_first,
        },
        lsp_definitions = { path_display = filename_first },
        lsp_references = { path_display = filename_first },
        lsp_implementations = { path_display = filename_first },
        lsp_document_symbols = { path_display = filename_first },
        lsp_dynamic_workspace_symbols = { path_display = filename_first },
    },
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        mappings = {
            i = {
                ['<c-u>'] = false,
                ['<c-d>'] = false,
            },
        },
        -- layout_strategy = 'vertical',
        layout_config = {
            width = 0.9,
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '-u' -- thats the new thing
        },
    },
    extensions = {
        live_grep_args = {
            vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number',
                '--column', '--smart-case', },
            path_display = filename_first
            -- auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_strategy = 'vertical',
            -- layout_config = { mirror=true }, -- mirror preview pane
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'harpoon')
pcall(require('telescope').load_extension, 'live_grep_args')
pcall(require('telescope').load_extension, 'noice')
