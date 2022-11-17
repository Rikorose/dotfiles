local _ = require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"json",
		"markdown",
		"python",
		"rust",
		"toml",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	refactor = {
    enable = true,
		highlight_definitions = { enable = true, clear_on_cursor_move = true },
		highlight_current_scope = { enable = false },
	},

	context_commentstring = {
		enable = true,

		-- With Comment.nvim, we don't need to run this on the autocmd.
		-- Only run it in pre-hook
		enable_autocmd = false,

		config = {
			c = "// %s",
			lua = "-- %s",
			rust = "/// %s",
		},
	},
})

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    vim.opt.foldenable     = false
  end
})
