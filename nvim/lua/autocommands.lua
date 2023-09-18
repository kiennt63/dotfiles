local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au('TextYankPost', {
    group = ag('yank_highlight', {}),
    pattern = '*',
    callback = function ()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})

au('CmdlineLeave', {
    group = ag('cmd_line_clear', {}),
    callback = function ()
        vim.fn.timer_start(5000, function ()
            vim.cmd [[ echon ' ' ]]
        end)
    end
})

au('FocusLost', {
    group = ag('save_on_focus_lost', {}),
    pattern = '*',
    callback = function ()
        vim.cmd [[ update ]]
    end
})

au('BufLeave', {
    group = ag('save_on_buffer_change', {}),
    pattern = '*',
    callback = function (opts)
        if vim.bo[opts.buf].filetype ~= 'TelescopePrompt' then
            vim.cmd [[ update ]]
        end
    end
})

-- au('BufWritePre', {
--     group = ag('format_on_save', {}),
--     pattern = '*.cpp',
--     command = "silent! lua vim.lsp.buf.format()"
-- })

-- au('BufWritePre', {
--     group = ag('format_on_save', {}),
--     pattern = '*.h',
--     command = "silent! lua vim.lsp.buf.format()"
-- })
