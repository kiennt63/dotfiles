local dap, dapui = require 'dap', require 'dapui'
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dapui.setup()
require('dap-python').setup 'python3'

local function is_dapui_active()
    return dapui.windows and #dapui.windows > 0
end

-- Create a conditional mapping for Ctrl+n
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = '*',
--     callback = function()
--         if is_dapui_active() then
--             -- Map Ctrl+n to dap.step_over() only when dap-ui is active
--             vim.keymap.set('n', '<C-n>', function()
--                 dap.step_over()
--             end, { noremap = true, silent = true, buffer = true })
--             vim.keymap.set('n', '<C-i>', function()
--                 dap.step_into()
--             end, { noremap = true, silent = true, buffer = true })
--             vim.keymap.set('n', '<C-o>', function()
--                 dap.step_out()
--             end, { noremap = true, silent = true, buffer = true })
--         else
--             -- Unmap or use default behavior if not in dap-ui mode
--             vim.api.nvim_del_keymap(0, 'n', '<C-n>')
--             vim.api.nvim_del_keymap(0, 'n', '<C-i>')
--             vim.api.nvim_del_keymap(0, 'n', '<C-o>')
--         end
--     end,
-- })

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('DAPKeymap', { clear = true }),
  pattern = '*',  -- This applies to all buffers
  callback = function()
    if dap.session() ~= nil then
      -- DAP session is active: set buffer-local keymap for Ctrl+n
      vim.keymap.set('n', '<C-n>', function()
        dap.step_over()
      end, { silent = true, buffer = true })
      vim.keymap.set('n', '<C-i>', function()
        dap.step_into()
      end, { silent = true, buffer = true })
      vim.keymap.set('n', '<C-o>', function()
        dap.step_out()
      end, { silent = true, buffer = true })
    else
      -- No DAP session: unmap <C-n> if it exists
      pcall(function() vim.api.nvim_buf_del_keymap(0, 'n', '<C-n>') end)
      pcall(function() vim.api.nvim_buf_del_keymap(0, 'n', '<C-i>') end)
      pcall(function() vim.api.nvim_buf_del_keymap(0, 'n', '<C-o>') end)
    end
  end,
})
