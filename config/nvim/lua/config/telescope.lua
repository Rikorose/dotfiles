local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  extensions = {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
      },
    },
  },
  defaults = {
    mappings = { i = { ["<c-t>"] = trouble.open_with_trouble, ["<esc>"] = actions.close } },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " ",
    -- selection_caret = " ",
    winblend = 10,
  },
  layout_config = {
    prompt_position = "bottom",
  },
})

telescope.load_extension("fzf")

local M = {}

M.project_files = function(opts)
  opts = opts or {}

  local _git_pwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if vim.v.shell_error ~= 0 then
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
    return
  end

  require("telescope.builtin").git_files(opts)
end

local util = require("util")

util.nnoremap("<Leader><Leader>", "<C-^>")
util.nnoremap("<Leader>sp", M.project_files)

return M
