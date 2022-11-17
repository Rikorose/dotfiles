local lsp = require "lsp-zero"
local log = require("plugins.log")
require "plugins.snips" -- load custom snippets

vim.diagnostic.config({
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
})

lsp.preset("recommended")
lsp.set_preferences({
  set_lsp_keymaps = false,
})
lsp.on_attach(function(client, bufnr)
  log.info("Attaching language server", client.name)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
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
require("rust-tools").setup({
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = true,
    },
  },
  server = lsp.build_options("rust_analyzer", {}),
})
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})
null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.fixjson.with({ filetypes = { "jsonc", "json" } }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with({ args = { "--quiet", "-" } }),
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.markdownlint,
  },
})

lsp.setup()

require("lsp_signature").setup()
require("trouble").setup({
  auto_open = false,
  use_diagnostic_signs = true,
})
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
})

vim.keymap.set("n", "<F5>", function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      if client.name == "sumneko_lua" then
        return false
      end
      log.info("trying to format with " .. client.name)
      return true
    end,
  })
end)

vim.keymap.set("n", "<leader>cs", "<cmd>WorkspaceSymbols<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>CodeActions<cr>")
vim.keymap.set("n", "<leader>cd", "<cmd>DiagnosticsAll<cr>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
