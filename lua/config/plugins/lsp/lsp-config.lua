return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- Plugin cầu nối quan trọng bạn đang thiếu
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Lấy capabilities từ nvim-cmp để LSP server hiểu

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			local map = vim.keymap.set
			map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
			map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Find references" }) -- Tối ưu: Dùng Telescope để xem references đẹp hơn
		end
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "clangd", "pyright", "gopls", "bashls" }, -- Tự động cài đặt
			handlers = {
				-- Default handler cho tất cả server
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				-- Cấu hình riêng cho Lua để sửa lỗi "Undefined global vim"
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
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
