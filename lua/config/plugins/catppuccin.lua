return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Cực kỳ quan trọng: Chọn 'mocha' thay vì mặc định
			background = { -- Cấu hình nền tối/sáng
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- Đặt true nếu muốn nền terminal trong suốt
			show_end_of_buffer = false, -- Tắt dấu ~ ở cuối file cho đỡ rối
			term_colors = true,
			dim_inactive = {
				enabled = true, -- Làm tối các cửa sổ không focus (giúp tập trung code chính)
				shade = "dark",
				percentage = 0.15,
			},
			styles = { -- Định dạng chữ
				comments = { "italic" }, -- Comment nghiêng (dễ phân biệt)
				conditionals = { "italic" },
				loops = {},
				functions = { "bold" }, -- Tên hàm in đậm
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integrations = { -- Tự động tô màu cho các plugin khác
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				lsp_trouble = true,
				cmp = true,
				gitsigns = true,
				telescope = {
					enabled = true,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "sapphire", -- Màu đường kẻ scope
					colored_indent_levels = false,
				},
				mason = true,
				-- neotree = true,
				which_key = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		-- Lệnh bắt buộc để load theme
		vim.cmd.colorscheme("catppuccin")
	end,
}
