--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local bind = vim.keymap.set
local function bind_n(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quickly leave insert mode
bind_n("i", "jj", "<Esc>")
bind_n("i", "jk", "<Esc>")
bind_n("i", "kj", "<Esc>")

-- Make j/k move screen visible lines, not file lines
bind_n("n", "j", "gj")
bind_n("n", "k", "gk")

-- Buffer navigation
bind_n("n", "<leader>n", ":bn<cr>")
bind_n("n", "<leader>p", ":bp<cr>")
bind_n("n", "<leader><space>", ":e#<cr>", { silent = true })

-- Window navigation
bind_n("n", "<C-h>", "<C-W>h")
bind_n("n", "<C-j>", "<C-W>j")
bind_n("n", "<C-k>", "<C-W>k")
bind_n("n", "<C-l>", "<C-W>l")
bind_n("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
bind_n("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
bind_n("n", "<leader>wh", "<C-W>s", { desc = "Split window below" })
bind_n("n", "<leader>wv", "<C-W>v", { desc = "Split window right" })

-- better indenting
bind_n("v", "<", "<gv")
bind_n("v", ">", ">gv")

-- Easy search and replace
bind_n("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
bind_n("v", "<leader>r", '"hy:%s/<C-r>h//g<Left><Left>')

-- Search
if not vim.g.vscode then
  bind_n("n", "<leader>s", "<cmd>lua require('fzf-lua').live_grep()<CR>")
  bind_n("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>")
  bind_n("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>")
  bind_n("n", "<leader>.", "<cmd>lua require('fzf-lua').command_history()<CR>")
  bind_n("n", "<leader>/", "<cmd>lua require('fzf-lua').search_history()<CR>")
else
  bind_n("n", "<leader>f", "<cmd>Find<cr>")
  bind_n("n", "<leader>s", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
  bind_n("n", "gs", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
end

-- Some LSP additions
bind("n", "K", vim.lsp.buf.hover)
bind("n", "gd", vim.lsp.buf.definition)
bind("n", "gD", vim.lsp.buf.declaration)
bind("n", "gI", vim.lsp.buf.implementation)
bind("n", "gt", vim.lsp.buf.type_definition)
bind("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostic in floating window" })
bind("n", "<leader>cr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename", expr = true })
local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  })
end
bind("n", "<leader>qf", quickfix, { silent = true })
bind("n", "<leader>ga", vim.lsp.buf.code_action)

-- LuaSnip: For changing choices in choiceNodes (not strictly necessary for a basic setup).

bind({ "i", "s" }, "<C-L>", function()
  local ls = require("luasnip")
  ls.jump(1)
end, { silent = true })
bind({ "i", "s" }, "<C-J>", function()
  local ls = require("luasnip")
  ls.jump(-1)
end, { silent = true })
bind({ "i", "s" }, "<C-E>", function()
  local ls = require("luasnip")
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
