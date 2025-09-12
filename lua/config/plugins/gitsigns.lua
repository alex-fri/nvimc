return {
"lewis6991/gitsigns.nvim",
 event = "BufReadPre",

 config = function()
  require("gitsigns").setup()
	vim.keymap.set("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {
		noremap = true,
		desc = "Preview Hunk",
	})
 end,
}
