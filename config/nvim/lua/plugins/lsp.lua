local lsp = require "lsp-zero"
require "plugins.snips" -- load custom snippets

vim.diagnostic.config {
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}

-- LSP zero setup
lsp.ensure_installed {
  "texlab",
}
lsp.preset "recommended"
lsp.set_preferences {
  set_lsp_keymaps = false,
}
lsp.on_attach(function(_, bufnr)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      -- Only open diagnostic float if no other floating windows are open
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "line",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  local noremap = { buffer = bufnr, remap = false }
  local bind = vim.keymap.set
  bind("n", "K", vim.lsp.buf.hover, noremap)
  bind("n", "gd", vim.lsp.buf.definition, noremap)
  bind("n", "gD", vim.lsp.buf.declaration, noremap)
  bind("n", "gt", vim.lsp.buf.type_definition, noremap)
  bind("n", "<ctrl-k>", vim.lsp.buf.signature_help, noremap)
end)
lsp.configure("texlab", {
  settings = {
    texlab = {
      chktex = { onEdit = true },
      formatterLineLength = 120,
      latexFormatter = "latexindent",
      forwardSearch = {
        args = { "--synctex-forward", "%l:1:%f", "%p" },
        executable = "zathura",
      },
    },
  },
})

lsp.nvim_workspace()
lsp.setup()

-- Null ls
local null_ls = require "null-ls"
local null_opts = lsp.build_options("null-ls", {})
null_ls.setup {
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.fixjson.with { filetypes = { "jsonc", "json" } },
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with { args = { "--quiet", "-" } },
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.diagnostics.markdownlint,
  },
}

-- Show signatures in insert mode
require("lsp_signature").setup()

-- Diagnostics in extra split
require("trouble").setup {
  auto_open = false,
  use_diagnostic_signs = true,
}
require("lsp-colors").setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
}

-- Formatting
vim.keymap.set("n", "<F5>", function()
  vim.lsp.buf.format {
    async = true,
    filter = function(client)
      if client.name == "sumneko_lua" then
        return false
      end
      return true
    end,
  }
end)

vim.keymap.set("n", "<leader>cs", "<cmd>WorkspaceSymbols<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>CodeActions<cr>")
vim.keymap.set("n", "<leader>cd", "<cmd>DiagnosticsAll<cr>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
