return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Plugin mới để auto-install
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- 1. LSP Servers (đã config trong lsp-config.lua)
				"lua-language-server",
				"clangd",
				"pyright",
				"gopls",
				"bash-language-server",

				-- 2. Formatters (cho conform.nvim)
				"stylua", -- Lua
				"black", -- Python
				"isort", -- Python imports
				"clang-format", -- C/C++
				"gofumpt", -- Go
				"goimports", -- Go imports
				"prettier", -- Web (JS/HTML/CSS/JSON) -> Nên có
			},

			-- Tự động cài đặt khi mở Neovim
			auto_update = true,
			run_on_start = true,
		})
	end,
}
