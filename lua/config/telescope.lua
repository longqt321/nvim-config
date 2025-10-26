local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        prompt_prefix= '🔍 ',
        selection_caret = '',
        path_display = {'smart'},
        file_ignore_patterns = {'node_modules','./git','build/','venv'},
        sorting_strategy = 'ascending',
        
        layout_config = {
            horizontal = {preview_width = 0.55},
        },
    },
    
    mappings = {
        i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
        },
    },

    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            sort_mru = true,
            ignore_current_buffer = true,
        },
    },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        }
    },
})

pcall(telescope.load_extension,'fzf')
