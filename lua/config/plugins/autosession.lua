return {
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				{
					auto_restore = false,
					auto_restore_last_session = false,
					auto_save = true,
					log_level = "info",
					root_dir = "/home/hipc/.local/share/nvim/sessions/",
					suppressed_dirs = { "~/", "~/Projects", "~/Downloads" }
				}
			})

			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
			vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
				desc = "Search Sessions",
			})
		end,
	},
}
