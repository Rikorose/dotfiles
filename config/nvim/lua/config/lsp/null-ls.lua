local M = {}

function M.setup(options)
  require("util").log(vim.inspect(options))
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    debug = true,
    sources = {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black.with({ args = { "--quiet", "-" } }),
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.diagnostics.selene,
      nls.builtins.code_actions.gitsigns,
    },
  })
  require("lspconfig")["null-ls"].setup(options)
end

function M.has_formatter(ft)
  local nls = require("null-ls")
  local sources = nls.get_source({
    filetypes = { [ft] = true },
    method = nls.methods.FORMATTING,
  })
  for _, f in ipairs(sources) do
    if f.filetypes[ft] == true then
      return true
    end
  end
end

return M
