-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--Automatically load changed files
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | silent! checktime | endif",
  pattern = { "*" },
})
-- Remember cursor position
vim.api.nvim_command('autocmd BufReadPost * silent! normal! g`"zv')

-- Automatically save buffers
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall")
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! checktime")

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
