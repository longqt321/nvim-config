-- Leader key
vim.g.mapleader = ' '
local map = vim.keymap.set

-- Key map
map('n','<C-f>',':NvimTreeOpen<CR>',{})
map('n','<leader>w',':w<CR>',{desc = 'Save file'})
map('n','<leader>q',':q<CR>',{desc = 'Quit'})
map('n', '<leader>ff',':Telescope find_files<CR>', { desc = 'Telescope find files' })
map('n', '<leader>fg',':Telescope live_grep<CR>', { desc = 'Telescope live grep' })
map('n', '<leader>fb',':Telescope buffers<CR>', { desc = 'Telescope buffers' })
map('n', '<leader>fh',':Telescope help_tags<CR>', { desc = 'Telescope help tags' })
map('n','<leader>fc',':Telescope current_buffer_tags<CR>',{desc = 'Tags in current buffer'})
