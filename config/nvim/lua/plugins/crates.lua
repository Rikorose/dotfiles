local null_ls = require "null_ls"
local cmp = require "nvim-cmp"

require("crates").setup {
  null_ls = { enabled = true, name = "crates.nvim" },
}

vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    cmp.setup.buffer { sources = { { name = "crates" } } }
  end,
})
