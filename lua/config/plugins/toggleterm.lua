return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<leader><CR>]],
			shade_terminals = true,
			direction = "float",
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
				windblend = 10,
			},
		})
	end,
}
