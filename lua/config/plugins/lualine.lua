return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enable = true,
                theme='auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline={},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'FileType',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                },
            },

        }
    end,
}

