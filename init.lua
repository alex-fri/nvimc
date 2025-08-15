-- Temporary workaround: https://github.com/neovim/neovim/issues/31675
vim.hl = vim.highlight
print("Neovim Config")

require("config.lazy")


-- Global orptions.
-- File specific oftions are set in after/ftplugin/<file_type>.lua
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

-- Global key mapping
-- Sourcing lua files
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Run selected lua code" })

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
-- Terminal
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
	end,
})

-- new tab
vim.keymap.set("n", "<space>nt", function()
	vim.cmd.tabnew()
end, { desc = "New tab" })

-- Get to normal mode from terminal mode
vim.keymap.set("t", "<C-e>", '<C-\\><C-n>', { noremap = true })

-- LSP and diagnostics
-- Should be default after 0.10.0 but seems not to be in for used 0.10.3 version
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename symbol under cursor" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Show references of symbol under cursor" })
vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "Show code actions for symbol under cursor" })
vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "Show implementations of symbol under cursor" })
vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { desc = "Format current buffer" })
vim.keymap.set('n', 'gre', vim.diagnostic.open_float)
vim.keymap.set('n', 'grle', vim.diagnostic.setloclist)

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalText guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi CursorLineNr guibg=NONE ctermbg=NONE
  hi Pmenu guibg=NONE ctermbg=NONE
  hi PmenuSbar guibg=NONE ctermbg=NONE
  hi PmenuSel guibg=NONE ctermbg=NONE
  hi PmenuThumb guibg=NONE ctermbg=NONE
]]

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Example for updating color from treesitter highlights
-- Make sure to apply it after color scheme or that color scheme does not define anything which makes it useless
-- vim.cmd [[hi @function.builtin guifg=pink]]

-- Close all buffers but current one
local function closeAllBuffersButCurrentOne()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
	print("Closed all buffers but current one")
end
vim.keymap.set('n', '<space>Q', closeAllBuffersButCurrentOne, { desc = "Close all buffers but current one" })

-- Clear search highlight
vim.keymap.set("n", "<space>cs", ":nohlsearch<CR>", { desc = "Clear search highlight" })
