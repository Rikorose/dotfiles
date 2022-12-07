local M = {}

M.sources = function()
  return {
    { name = "path", trigger_characters = { ".", "/" }, keyword_length = 1 },
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "luasnip", keyword_length = 2 },
    { name = "buffer", keyword_length = 1 },
    { name = "crates", keyword_length = 2 },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return require("cmp.config.context").in_treesitter_capture "spell"
        end,
      },
    },
  }
end

M.cmp_config = function()
  return require("lsp-zero").defaults.cmp_config { source = M.sources() }
end

return M
