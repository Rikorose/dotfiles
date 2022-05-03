local o = vim.opt

o.mouse = "a" -- enable mouse mode
o.exrc = false -- ignore '~/.exrc'
o.secure = true
o.modelines = 1 -- read a modeline at EOF
o.errorbells = false -- disable error bells (no beep/flash)
o.termguicolors = true -- enable 24bit colors

o.updatetime = 250 -- decrease update time
o.autoread = true -- auto read file if changed outside of vim
o.fileformat = "unix" -- <nl> for EOL
o.switchbuf = "useopen"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.backspace = { "eol", "start", "indent" }
o.matchpairs = { "(:)", "{:}", "[:]", "<:>" }

-- vim clipboard copies to system clipboard
-- unnamed     = use the " register (cmd-s paste in our term)
-- unnamedplus = use the + register (cmd-v paste in our term)
o.clipboard = "unnamedplus"

o.showmode = true -- show current mode (insert, etc) under the cmdline
o.showcmd = true -- show current command under the cmd line
o.textwidth = 100 -- max inserted text width for paste operations
o.linespace = 0 -- font spacing
o.ruler = true -- show line,col at the cursor pos
o.number = true -- show absolute line no. at the cursor pos
o.cursorline = true -- Show a line where the current cursor is
o.signcolumn = "yes" -- Show sign column as first column
vim.g.colorcolumn = 101 -- global var, mark column 101
o.colorcolumn = tostring(vim.g.colorcolumn)
o.wrap = true -- wrap long lines
o.breakindent = true -- start wrapped lines indented
o.linebreak = true -- do not break words on line wrap
o.undofile = true -- save undo history
o.ignorecase = true -- case insensitive searching
o.smartcase = true
o.hidden = true -- hidden buffers
o.backup = false -- don't use backup files, we use git
o.swapfile = false
o.writebackup = false
o.inccommand = "split" -- live substitution
o.whichwrap = o.whichwrap + "hl" -- Make h/l move across beginning/end of line

o.cindent = true -- C-style indentation
o.expandtab = true -- Tabs are spaces
o.shiftwidth = 2 -- 2 Spaces are enough
o.softtabstop = 2
o.tabstop = 2
o.shiftround = true

-- Automatically save buffers
o.autowriteall = true
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall")
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! checktime")

-- Remember cursor position
vim.api.nvim_command('autocmd BufReadPost * silent! normal! g`"zv')

-- Highlight on yank
vim.api.nvim_command("au TextYankPost * lua vim.highlight.on_yank {}")

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
-- vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- use ':grep' to send resulsts to quickfix
-- use ':lgrep' to send resulsts to loclist
if vim.fn.executable("rg") == 1 then
  o.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
  o.grepformat = "%f:%l:%c:%m"
end

-- Disable providers we do not care a about
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Disable some in built plugins completely
local disabled_built_ins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  -- 'matchit',
  --'matchparen',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Latex filetype stuff
vim.g.tex_flavor = "latex"
vim.cmd("autocmd BufReadPost *.tikz set filetype=tex")

require("plugins")
-- no need to load this immediately, since we have packer_compiled
-- vim.defer_fn(function()
--   require("plugins")
-- end, 0)
