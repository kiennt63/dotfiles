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

au('FileType', {
    group = ag('HarpoonMenu', {}),
    pattern = 'harpoon',
    callback = function ()
        vim.keymap.set('n', '1', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '2', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '3', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '4', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '5', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '6', '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '7', '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '8', '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '9', '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', { silent = true, buffer = true })
        vim.keymap.set('n', '10', '<cmd>lua require("harpoon.ui").nav_file(10)<cr>', { silent = true, buffer = true })
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
