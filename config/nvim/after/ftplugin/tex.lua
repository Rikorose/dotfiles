local o = vim.opt

o.formatoptions = o.formatoptions
  - "t" -- Don't auto format my code. I got linters for that.
  - "c" -- Comments may exceed text width.

o.spell = true
o.spelllang = "en_us"

function _G.tex_formatexpr(fstart, fend)
  return vim.vim.cmd("silent execute a:fstart.','.a:fend.'s/[.!?]\zs /\r/g'")
end

o.formatexpr = "v:lua:tex_formatexpr()"
