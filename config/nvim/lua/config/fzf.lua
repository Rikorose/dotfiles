local fzf = require("fzf-lua")

local config = fzf.config.globals
config["fzf_opts"]["--layout"] = "default"
-- Todo:
-- config["previewers"] = vim.tbl_deep_extend("force", config.previewers, {
--   files = {
--     cmd = "lsd",
--     args = "-l",
--   },
--  [[ $COLORTERM =~ ^(truecolor|24bit)$ ]] && echo support})
fzf.setup(config)
