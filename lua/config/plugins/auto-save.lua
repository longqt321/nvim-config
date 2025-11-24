return {
	"pocco81/auto-save.nvim",
	event = "VeryLazy",
	config = function()
		require("auto-save").setup({
			enabled = true,
			execution_message = {
				message = function()
					return ("Saved at " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.18,
				cleaning_interval = 1250,
			},
			trigger_events = { "InsertLeave" },
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")
				if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.expand("%:t"), { "NvimTree" }) then
					return true
				end
				return false
			end,
		})
	end,
}
