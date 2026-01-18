return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("lsp_signature").setup({
			bind = true, -- Tự động gắn vào LSP
			handler_opts = {
				border = "rounded",
			},
			hint_enable = true, -- Hiển thị hint ảo (virtual text) ngay dòng code
			hint_prefix = "🐼 ",
		})
	end,
}
