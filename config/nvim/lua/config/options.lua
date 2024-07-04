-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vim = vim
local o = vim.opt

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

o.number = true -- line number
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

-- Better tab matching in command mode
o.wildmode = "longest:full,full"
o.wildignorecase = true

vim.cmd([[ set formatoptions-=t ]]) -- No line break in insert mode

--Automatically load changed files
vim.o.autoread = true
-- Automatically save buffers
o.autowriteall = true

-- Set grep default grep command with ripgrep
o.grepprg = "rg --vimgrep --no-heading --smart-case --follow"
o.errorformat:append("%f:%l:%c%p%m")

-- Latex filetype stuff
vim.g.tex_flavor = "latex"
vim.cmd("autocmd BufReadPost *.tikz set filetype=tex")

vim.cmd("set rtp+=/usr/bin/fzf")
