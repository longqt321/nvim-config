return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"hrsh7th/cmp-buffer", -- Buffer words
		"hrsh7th/cmp-path", -- File paths
		"hrsh7th/cmp-cmdline", -- Cmdline completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet completions
		"rafamadriz/friendly-snippets", -- Common snippets
	},
	config = function()
		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ { name = "path" } },
				{
					{
						name = "cmdline",
						options = {
							ignore_cmds = { "Man", "!" },
						},
					},
				},
			}),
		})
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("lus_ls", {
			capabilities = capabilities,
		})
		vim.lsp.config("cpp", {
			capabilities = capabilities,
		})
		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})
	end,
}
