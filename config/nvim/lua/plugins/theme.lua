vim.o.background = "dark"

if vim.env.COLORTERM == "truecolor" or vim.env.COLORTERM == "24bit" then
	vim.cmd([[colorscheme one-nvim]])
end
