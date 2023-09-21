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
    callback = function (opts)
        if vim.bo[opts.buf].filetype ~= 'TelescopePrompt'
            and vim.bo[opts.buf].filetype ~= 'neo-tree'
            and vim.bo[opts.buf].filetype ~= 'neo-tree-popup'
            and vim.bo[opts.buf].filetype ~= 'Lazy' then
            vim.cmd [[ update ]]
        end
    end
})

au('BufLeave', {
    group = ag('save_on_buffer_change', {}),
    pattern = '*',
    callback = function (opts)
        if vim.bo[opts.buf].filetype ~= 'TelescopePrompt'
            and vim.bo[opts.buf].filetype ~= 'neo-tree'
            and vim.bo[opts.buf].filetype ~= 'neo-tree-popup'
            and vim.bo[opts.buf].filetype ~= 'lazy' then
            vim.cmd [[ update ]]
        end
    end
})

-- local modifiedBufs = function (bufs)
--     local t = 0
--     for k, v in pairs(bufs) do
--         if v.name:match("NvimTree_") == nil then
--             t = t + 1
--         end
--     end
--     return t
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function (opts)
--         if #vim.api.nvim_list_wins() == 1 and
--             vim.bo[opts.buf].filetype == 'NvimTree' and
--             modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
--             -- vim.cmd ":NvimTreeClose"
--             vim.cmd "quit"
--         end
--     end
-- })

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
