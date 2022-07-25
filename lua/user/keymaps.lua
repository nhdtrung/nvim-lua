local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "vv", "<C-w>v", opts)
keymap("n", "ss", "<C-w>s", opts)

-- Move back and forth through previous and next buffers
-- with ,z and ,x
keymap("n", ",z", ":bp<CR>", opts)
keymap("n", ",x", ":bn<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers/tabs
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Splits
keymap("n", "<v-v>", ":vsplit>", opts)
keymap("n", "<s-s>", ":split>", opts)

-- Highlight
keymap("n", "//", ":nohlsearch<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

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

-- fzf lua
keymap("n", "<Leader>r", ":lua require('fzf-lua').files()<CR>", opts)
keymap("n", "<Leader>b", ":lua require('fzf-lua').buffers()<CR>", opts)
keymap("n", "<Space>o", ":lua require('fzf-lua').lsp_document_symbols()<CR>", opts)
keymap("n", "<Space>a", ":lua require('fzf-lua').diagnostics_document()<CR>", opts)

-- nvim spectre
keymap("n", "<Leader>S", ":lua require('spectre').open()<CR>", opts)
keymap("n", "<Leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", opts)
keymap("v", "<Leader>s", "<esc>:lua require('spectre').open_visual()<CR>", opts)

--- nvim-tree
keymap('n', "<C-\\>", "<cmd>:NvimTreeFindFileToggle<CR>", opts)
