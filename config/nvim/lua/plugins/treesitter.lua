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
		use_languagetree = false,
	},

	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },

		smart_rename = {
			enable = false,
			keymaps = {
				-- mapping to rename reference under cursor
				smart_rename = "grr",
			},
		},

		navigation = {
			enable = false,
			keymaps = {
				goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
				list_definitions = "gnD", -- mapping to list all definitions in current file
			},
		},
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
