return {
	{
		"neovim/nvim-lspconfig",
		-- dependencies = {
		--	"folke/lazydev.nvim",
		-- ft = "lua", -- only load on lua files
		--	opts = {
		--		library = {
		--			-- See the configuration section for more details
		--			-- Load luvit types when the `vim.uv` word is found
		--			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		--		},
		--	},
		-- },
		config = function()
			require("lspconfig").pylsp.setup{
				settings = {
					pylsp = {
						virtual_text = true,
						plugins = {
							pycodestyle = {
								ignore = {'W391'},
								maxLineLength = 100
							}
						}
			  	}
				}
			}
		end,
	}
}
