local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

vim.keymap.set("n", "<F5>", function()
	vim.lsp.buf.format({ async = true })
end)
