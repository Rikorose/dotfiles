--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function bind(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quickly leave insert mode
bind("i", "jj", "<Esc>")
bind("i", "jk", "<Esc>")
bind("i", "kj", "<Esc>")

-- Make j/k move screen visible lines, not file lines
bind("n", "j", "gj")
bind("n", "k", "gk")

-- window navigation
bind("n", "<C-j>", "<C-w>j")
bind("n", "<C-k>", "<C-w>k")
bind("n", "<C-l>", "<C-w>l")
bind("n", "<C-h>", "<C-w>h")

-- Buffer navigation
bind("n", "<leader>n", ":bn<cr>")
bind("n", "<leader>p", ":bp<cr>")
bind("n", "<leader><space>", ":e#<cr>", { silent = true })

-- Easier pasting
bind("n", "[p", ":pu!<cr>")
bind("n", "]p", ":pu<cr>")

-- Make visual yanks place the cursor back where started
bind("v", "y", "ygv<Esc>")

-- better indenting
bind("v", "<", "<gv")
bind("v", ">", ">gv")

-- Easy search and replace
bind("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
bind("v", "<leader>r", '"hy:%s/<C-r>h//g<Left><Left>')

-- Window management
bind("n", "<leader>ww", "<C-W>p") -- other window
bind("n", "<leader>wd", "<C-W>c") -- delete window
bind("n", "<leader>wh", "<C-W>s") -- split below (horizontal)
bind("n", "<leader>wv", "<C-W>v") -- split right (vertical)

-- Search
bind("n", "<leader>s", "<cmd>Rg<cr>")
bind("n", "<leader>b", "<cmd>Buffers<cr>")
bind("n", "<leader>f", "<cmd>Files<cr>")
bind("n", "<leader>.", "<cmd>History:<cr>")
bind("n", "<leader>/", "<cmd>History/<cr>")
