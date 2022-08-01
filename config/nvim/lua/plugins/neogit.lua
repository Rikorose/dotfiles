require("diffview").setup({
	use_icons = false,
})

require("neogit").setup({
	disable_hint = true,
	auto_refresh = false,
	integrations = { diffview = true },
	signs = {
		section = { "»", "-" },
		item = { "+", "*" },
	},
	mappings = {
		status = {
			[";"] = "RefreshBuffer",
		},
	},
})

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>lua require'gitsigns'.diffthis()<CR>")
