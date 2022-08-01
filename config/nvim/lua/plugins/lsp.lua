local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.on_attach(function(_, bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "line",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end)
lsp.setup()

require("lsp_signature").setup()
require("rust-tools").setup({
	inlay_hints = {
		only_current_line = false,
	},
	server = {
		standalone = false,
	},
})
require("trouble").setup({
	auto_open = false,
	use_diagnostic_signs = true,
})
require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})

vim.keymap.set("n", "<F5>", function()
	vim.lsp.buf.format({ async = true })
end)

vim.keymap.set("n", "<leader>cs", "<cmd>WorkspaceSymbols<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>CodeActions<cr>")
vim.keymap.set("n", "<leader>cd", "<cmd>DiagnosticsAll<cr>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
