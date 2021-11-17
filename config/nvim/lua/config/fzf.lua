local fzf = require("fzf-lua")

local previewers = vim.tbl_deep_extend("force", fzf.config.globals.previewers, {
  files = {
    cmd = "lsd",
    args = "-l",
  },
})

fzf.setup({ previewers = { files = { cmd = "ls", args = "-l" } }, fzf_opts = { ["--layout"] = "default" } })
