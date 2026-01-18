return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- Plugin cầu nối quan trọng bạn đang thiếu
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		-- Lấy capabilities từ nvim-cmp để LSP server hiểu
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "clangd", "pyright", "gopls", "bashls" }, -- Tự động cài đặt
			handlers = {
				-- Default handler cho tất cả server
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Cấu hình riêng cho Lua để sửa lỗi "Undefined global vim"
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
							},
						},
					})
				end,
				-- Cấu hình riêng cho Java (bỏ qua nếu dùng nvim-java)
				["jdtls"] = function()
					-- Để nvim-java lo, không setup ở đây
				end,
			},
		})
	end,
}
