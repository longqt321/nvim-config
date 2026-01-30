return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Kho dữ liệu snippet
		},
		config = function()
			-- Load snippet từ friendly-snippets vào LuaSnip
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Cấu hình mở rộng cho LuaSnip (tùy chọn)qq
			require("luasnip").config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})
		end,
	},
}
