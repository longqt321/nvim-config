return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- Override các hàm mặc định của Neovim để dùng UI của Noice
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- Dùng Noice để render docs cho nvim-cmp
			},
		},
		-- Cấu hình Routing: Lọc bỏ các thông báo rác
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" }, -- Bỏ thông báo "100L, 2000B written" khi lưu file
						{ find = "; after #%d+" }, -- Bỏ thông báo Undo
						{ find = "; before #%d+" }, -- Bỏ thông báo Redo
					},
				},
				view = "mini", -- Chuyển các thông báo này xuống góc nhỏ (mini) hoặc bỏ qua
				opts = { skip = false },
			},
		},
		presets = {
			bottom_search = true, -- Thanh tìm kiếm nằm dưới cùng (quen thuộc giống Vim cũ)
			command_palette = true, -- Command line ra giữa màn hình (đẹp như Sublime/VSCode)
			long_message_to_split = true, -- Log dài sẽ mở split window thay vì popup
			inc_rename = false, -- Tắt dialog rename của Noice (để dùng mặc định hoặc plugin khác nhẹ hơn)
			lsp_doc_border = true, -- Thêm viền cho popup tài liệu (LSP Hover) -> Dễ đọc hơn
		},
		-- Tinh chỉnh giao diện Popup
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},
}
