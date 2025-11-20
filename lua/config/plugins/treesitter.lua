return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"lua",
					"cpp",
					"python",
					"c",
					"javascript",
					"html",
					"vimdoc",
					"query",
					"markdown",
					"bash",
				},
				autoinstall = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
