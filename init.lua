-- Temporary workaround: https://github.com/neovim/neovim/issues/31675
vim.hl = vim.highlight
print("Neovim Config")

require("config.lazy")

-- Example for updating color from treesitter highlights
-- Make sure to apply it after color scheme
vim.cmd [[hi @function.builtin guifg=lightgreen]]

-- Global orptions.
-- File specific oftions are set in after/ftplugin/<file_type>.lua
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

-- Global key mapping
-- Sourcing lua files
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Terminal
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
	end,
})

vim.keymap.set("n", "<space>tt", function()
	vim.cmd.tabnew()
	vim.cmd.term()
end)

vim.keymap.set("t", "<C-e>", '<C-\\><C-n>', {noremap = true})
-- LSP
-- Should be default after 0.10.0 but seems not to be in for used 0.10.3 version
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "grr", vim.lsp.buf.references)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
vim.keymap.set("n", "<space>f", vim.lsp.buf.format)


-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})
