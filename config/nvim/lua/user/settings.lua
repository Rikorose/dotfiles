local vim = vim
local o = vim.opt

o.mouse = "a" -- enable mouse mode

-- Keep lines below cursor when scrolling
o.scrolloff = 2
o.sidescrolloff = 5

-- When opening a window put it right or below the current one
o.splitright = true
o.splitbelow = true

-- Tab set to two spaces
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.updatetime = 250 -- decrease update time
o.fileformat = "unix" -- <nl> for EOL
o.switchbuf = "useopen"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.matchpairs = { "(:)", "{:}", "[:]", "<:>" }

-- vim clipboard copies to system clipboard
-- unnamed     = use the " register (cmd-s paste in our term)
-- unnamedplus = use the + register (cmd-v paste in our term)
o.clipboard = "unnamedplus"

o.modelines = 1 -- read a mode line at EOF
o.errorbells = false -- disable error bells
o.termguicolors = true -- enable 24bit colors
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
o.wrap = true -- disable wrap long lines
o.breakindent = true -- start wrapped lines indented
o.linebreak = false -- do not break words on line wrap
o.undofile = true -- save undo history
o.ignorecase = true -- case insensitive searching
o.smartcase = true
o.hidden = true -- hidden buffers
o.backup = false -- don't use backup files, we use git
o.swapfile = false
o.writebackup = false
o.inccommand = "split" -- live substitution
o.whichwrap = o.whichwrap + "hl" -- Make h/l move across beginning/end of line

vim.cmd [[ set formatoptions-=t ]] -- No line break in insert mode

--Automatically load changed files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
-- Automatically save buffers
o.autowriteall = true
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall")
vim.api.nvim_command("autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! checktime")

-- Remember cursor position
vim.api.nvim_command('autocmd BufReadPost * silent! normal! g`"zv')

-- Highlight on yank
vim.api.nvim_command("au TextYankPost * lua vim.highlight.on_yank {}")

-- Look for a tag file in the git folder
-- I shouldn't have to use `cwd` but here we are
o.tags:prepend(string.format("%s/.git/tags", vim.fn.getcwd()))

-- Insert mode completion setting
o.completeopt = { "menu", "menuone" }

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Set grep default grep command with ripgrep
o.grepprg = "rg --vimgrep --no-heading --smart-case --follow"
o.errorformat:append("%f:%l:%c%p%m")

-- Latex filetype stuff
vim.g.tex_flavor = "latex"
vim.cmd("autocmd BufReadPost *.tikz set filetype=tex")
