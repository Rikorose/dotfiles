local ok, signs = pcall(require, "gitsigns")
if not ok then
	return
end

signs.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "GitSignsDelete", text = "~", numhl = "GitSignsChangeNr" },
	},
	-- Highlights just the number part of the number column
	numhl = true,
	-- Highlights the _whole_ line.
	--    Instead, use gitsigns.toggle_linehl()
	linehl = false,
	-- Highlights just the part of the line that has changed
	--    Instead, use gitsigns.toggle_word_diff()
	word_diff = false,

	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		["n <space>ghn"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
		["n <space>ghp"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
		["n <leader>ghP"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>ghb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	},

	current_line_blame_opts = {
		delay = 2000,
		virt_text_pos = "eol",
	},
})
