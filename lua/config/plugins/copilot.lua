return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },                    -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                       -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		config = function()
			require("CopilotChat").setup({
				-- window = {
				-- 	layout = "float", -- or "horizontal", "vertical", "tab"
				-- 	float_opts = {
				-- 		border = "rounded",
				-- 		width = 0.6,
				-- 		height = 0.6,
				-- 	},
				-- }
			}
			)
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<C-J>", "copilot#Accept()",
				{ silent = true, expr = true, desc = "Accept Copilot suggestion" })
			vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat" })
			vim.api.nvim_set_keymap("n", "<leader>ce", ":CopilotChatExplain<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat Explain" })
			vim.api.nvim_set_keymap("v", "<leader>ce", ":CopilotChatExplain<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat Explain" })
			vim.api.nvim_set_keymap("n", "<leader>cf", ":CopilotChatFix<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat To Fix" })
			vim.api.nvim_set_keymap("v", "<leader>cf", ":CopilotChatFix<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat To Fix" })

		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
}
