return {
	"folke/todo-comments.nvim",
	-- TODO: TEST
	-- FIXME: Test phat nua
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous Todo",
		},
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
	},
}
