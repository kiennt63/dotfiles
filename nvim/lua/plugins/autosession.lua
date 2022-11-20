local function restore_nvim_tree()
    local nvim_tree = require('nvim-tree')
    nvim_tree.change_dir(vim.fn.getcwd())
    nvim_tree.refresh()
end

-- local function close_neo_tree()
--   require 'neo-tree.sources.manager'.close_all()
--   -- vim.notify('closed all')
-- end
--
-- local function open_neo_tree()
--   -- vim.notify('opening neotree')
--   require 'neo-tree.sources.manager'.show('filesystem')
--   require 'neo-tree.sources.manager'.reveal_current_file('filesystem')
-- end

require("auto-session").setup {
  log_level = "error",

  cwd_change_handling = {
    restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
    pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
    post_restore_cmds = { restore_nvim_tree },
  },
}

-- require 'auto-session'.setup {
--   auto_session_create_enabled = false,
--   auto_save_enabled = true,
--   auto_restore_enabled = true,
--   auto_session_use_git_branch = true,
--   bypass_session_save_file_types = { "neo-tree" },
--   pre_save_cmds = {
--     close_neo_tree,
--   },
--   post_restore_cmds = {
--     open_neo_tree,
--   }
-- }
