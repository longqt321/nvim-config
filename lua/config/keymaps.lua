-- Leader key
vim.g.mapleader = " "
local map = vim.keymap.set

-- Global map
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>wa", ":wa<CR>", { desc = "Write all" })
map("i", "<F12>", "<Esc>", { desc = "Escape" })
-- Move between windows
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})
-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Close buffer
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })

-- Better indenting (keep selection)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Nvimtree map
map("n", "<C-f>", ":NvimTreeOpen<CR>", {})

-- Telescope map
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Telescope help tags" })
map("n", "<leader>fc", ":Telescope current_buffer_tags<CR>", { desc = "Tags in current buffer" })
