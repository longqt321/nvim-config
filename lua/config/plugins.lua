-- Plugin lazy.vim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000
    },

    {
        'nvim-treesitter/nvim-treesitter',build = ':TSUpdate'
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {"nvim-tree/nvim-web-devicons",},
        config = function()
            require('nvim-tree').setup{
                sort = {sorter = 'case_sensitive'},
                view = {width=30},
                renderer = {group_empty=true},
                filters = {dotfiles = true},
            }
        end,
    },
}
local opts = {}

require('lazy').setup(plugins,opts)
