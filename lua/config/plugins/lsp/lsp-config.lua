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
			local keymap = vim.keymap.set

			opts.desc = "Go to definition"
			keymap("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "Hover documentation"
			keymap("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Go to implementation"
			keymap("n", "gi", vim.lsp.buf.implementation, opts)

			opts.desc = "Go to declaration"
			keymap("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Code action"
			keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Rename symbol"
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show references"
			keymap("n", "gr", require("telescope.builtin").lsp_references, opts) -- Tối ưu: Dùng Telescope để xem references đẹp hơn
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
