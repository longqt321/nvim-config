return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- Hiển thị số thứ tự (1, 2, 3...) bên cạnh tên file để dễ dùng Alt+Số
			numbers = "ordinal",
			-- Tích hợp hiển thị lỗi từ LSP lên tab
			diagnostics = "nvim_lsp",
			-- Dịch chuyển tab khi mở NvimTree
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		local map = vim.keymap.set

		-- 1. Chuyển đổi nhanh bằng Alt + Số (1 đến 9)
		for i = 1, 9 do
			map("n", "<A-" .. i .. ">", function()
				require("bufferline").go_to(i, true)
			end, { desc = "Go to buffer " .. i })
		end

		-- 2. Chuyển đổi giữa các tab (file)
		-- Lưu ý: "Alt+Tab" thường bị Hệ điều hành chặn để chuyển cửa sổ.
		-- Giải pháp thay thế tốt nhất là dùng Alt + dấu chấm (.) và phẩy (,) hoặc Shift+h/l
		map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
		map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer tab" })

		-- Nếu terminal của bạn gửi được mã phím Alt+Tab, dòng dưới sẽ hoạt động:
		map("n", "<M-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })

		-- Tùy chọn: Map lại Shift+h/l của bạn để dùng logic của bufferline (mượt hơn)
		map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
	end,
}
