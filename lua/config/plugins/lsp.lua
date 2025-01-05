return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		config = function()
			require("lspconfig").lua_ls.setup {}
			require("lspconfig").pylsp.setup{
			--	settings = {
			--		pylsp = {
			--			plugins = {
			--				pycodestyle = {
			--					ignore = {'W391'},
			--					maxLineLength = 100
			--				}
			--			}
			--		}
			--  }
			}
			require("lspconfig").bashls.setup{}
			require("lspconfig").gopls.setup{}
		end,
	}
}
