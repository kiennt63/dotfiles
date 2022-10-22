local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Normal --

-- Open sidebar
keymap("n", "<leader>e", ":NvimTreeFocus<cr>", opts)
keymap("n", "<leader>b", ":NvimTreeToggle<cr>", opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>w", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<leader>bd", ":Bdelete<CR>", opts)
keymap("n", "<A-1>", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("n", "<A-2>", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
keymap("n", "<A-3>", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
keymap("n", "<A-4>", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
keymap("n", "<A-5>", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
keymap("n", "<A-6>", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
keymap("n", "<A-7>", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
keymap("n", "<A-8>", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
keymap("n", "<A-9>", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)
keymap("n", "<A-n>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<A-p>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", opts)
keymap("n", "<leader>bl", "<cmd>b#<CR>", opts)

-- Saving and stuff
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>qa", ":qa<CR>", opts)

keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>wa", ":wa<CR>", opts)

keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>wqa", ":wqa<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<leader>F", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    , opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>fp", "<cmd>Telescope media_files<cr>", opts)

-- File manager
keymap("n", "<leader>fq", ":RnvimrToggle<cr>", opts)
