local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set


--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal --

-- LSP

keymap('n', '<leader>lt', ':ClangdSwitchSourceHeader<cr>', opts)

-- -- Open sidebar
-- vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<cr>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
keymap('n', '<C-j>', '<C-w>w', opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap('n', '<C-A-l>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-A-h>', ':vertical resize +2<CR>', opts)

-- Remove hls
keymap('n', '<esc><esc>', ':noh<cr>', opts)

-- =======================================================
-- Navigate buffers
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<leader>bd', ':Bdelete<CR>', opts)
-- keymap('n', '<A-1>', "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
-- keymap('n', '<A-2>', "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
-- keymap('n', '<A-3>', "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
-- keymap('n', '<A-4>', "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
-- keymap('n', '<A-5>', "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
-- keymap('n', '<A-6>', "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
-- keymap('n', '<A-7>', "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
-- keymap('n', '<A-8>', "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
-- keymap('n', '<A-9>', "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)
-- keymap("n", "<A-n>", "<cmd>BufferLineCycleNext<CR>", opts)
-- keymap("n", "<A-p>", "<cmd>BufferLineCyclePrev<CR>", opts)
-- keymap('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', opts)
-- keymap('n', '<leader>bl', '<cmd>b#<CR>', opts)

-- Navigate harpoon
keymap('n', '<A-1>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap('n', '<A-2>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap('n', '<A-3>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap('n', '<A-4>', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', opts)
keymap('n', '<A-5>', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', opts)
keymap('n', '<A-6>', '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', opts)
keymap('n', '<A-7>', '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', opts)
keymap('n', '<A-8>', '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', opts)
keymap('n', '<A-9>', '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', opts)

keymap('n', '<leader>bp', '<cmd>lua require("harpoon.mark").add_file()<cr>', opts)
keymap('n', '<leader>fh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)

-- =======================================================
-- Saving and stuff
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>qa', ':qa<CR>', opts)

keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>wa', ':wa<CR>', opts)

keymap('n', '<leader>wq', ':wq<CR>', opts)
keymap('n', '<leader>wqa', ':wqa<CR>', opts)

-- =======================================================
-- Normal
-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==', opts)
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==', opts)

-- =======================================================
-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- =======================================================
-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Copy to clipboard
keymap('v', '<leader>y', '"+y', opts)

-- =======================================================
-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Copy to clipboard
keymap('x', '<leader>y', '"+y', opts)

-- Share yank and paste between vim processes
keymap('v', '<leader>gy', ':w! /tmp/vitmp<CR>', opts)
keymap('n', '<leader>gp', ':r! cat /tmp/vitmp<CR>', opts)

-- =======================================================
-- Trouble
keymap('n', '<leader>t', ':TroubleToggle<cr>', opts)

-- Diagnostic
keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>', { desc = '[L]SP [D]iagnostic' })

-- =======================================================
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<leader>F", "<cmd>Telescope find_files<cr>", opts)
local live_grep_args_shortcuts = require('telescope-live-grep-args.shortcuts')
keymap('n', '<leader>ff',
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts)
keymap('n', '<leader>o',
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts)
-- keymap('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap('n', '<leader>fg',
    ":lua require('telescope').extensions.live_grep_args.live_grep_args({ layout_stategy = 'vertical' })<CR>",
    opts)
keymap('n', '<leader>fw', live_grep_args_shortcuts.grep_word_under_cursor, opts)
keymap('v', '<leader>fs', live_grep_args_shortcuts.grep_visual_selection, opts)

keymap('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]resume' })

-- Git workstree
keymap('n', '<leader>wt', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", { desc = '[W]ork[T]ree' })
keymap('n', '<leader>wc', "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", { desc = '[W]orktree [C]reate' })

-- File manager
keymap('n', '<leader>fq', ':RnvimrToggle<cr>', opts)

-- Searching
keymap('v', '//', [[y/\V<c-r>=escape(@",'/\')<cr><cr>]], opts)

-- Focus mode (centering window)
keymap('n', '<leader>np', ':NoNeckPain<cr>', opts)

-- Git sign
keymap('n', '<leader>gs', ':Gitsigns preview_hunk<cr>', opts)
keymap('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<cr>', opts)
keymap('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<cr>', opts)
keymap('n', '<leader>gn', ':Gitsigns next_hunk<cr>', opts)
keymap('n', '<leader>gp', ':Gitsigns prev_hunk<cr>', opts)

-- Noice (messages and notification)
keymap('n', '<leader>nd', ':NoiceDismiss<cr>', opts)
