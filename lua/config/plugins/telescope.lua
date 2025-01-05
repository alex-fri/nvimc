return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
			"tpope/vim-fugitive",
			{
				"aaronhallaert/advanced-git-search.nvim",
				cmd = { "AdvancedGitSearch" },
			}
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy"
					}
				},
				extensions = {
					fzf = {},
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true
					},
				}
			}

			require('telescope').load_extension('fzf')
			require('telescope').load_extension('file_browser')
			require("telescope").load_extension("advanced_git_search")

			-- find/grep
			vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
			vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

			-- file explorer
			vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

			-- advanced git search
			vim.keymap.set("n", "<space>git", ":AdvancedGitSearc<CR>")
		end
	}
}
