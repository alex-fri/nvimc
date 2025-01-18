return {
  {
      'ziglang/zig.vim', version = '*',
      config = function()
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = vim.api.nvim_create_augroup('Zig', { clear = true }),
					pattern = { "*.zig", "*.zon" },
					callback = function()
						vim.lsp.buf.format()
					end,
				})
      end
  }
}
