return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "│" },
		scope = { enabled = false }, -- Tắt scope line để tối ưu hiệu năng cho máy i5
	},
}
