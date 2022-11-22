local o = vim.opt
local util = require "util"

o.formatoptions = o.formatoptions
  - "t" -- Don't auto format my code. I got linters for that.
  - "c" -- Comments may exceed text width.

o.spell = true
o.spelllang = "en_us"

util.nnoremap("<F6>", ":TexlabBuild<cr>")
util.nnoremap("<F7>", ":TexlabForward<cr>")
