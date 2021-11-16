require("config.lsp.diagnostics")

local function on_attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  require("lsp_signature").on_attach()
end

local servers = {
  pyright = {},
  bashls = {},
  jsonls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = "clippy" },
      },
    },
  },
  texlab = {
    settings = {
      texlab = {
        latexindent = {
          modifyLineBreaks = false,
        },
        bibtexFormatter = "texlab",
        formatterLineLength = 0,
      },
    },
  },
  ltex = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
require("config.lsp.null-ls").setup(options)
require("config.lsp.install").setup(servers, options)
