local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.hydralsp then
  configs.hydralsp = {
    default_config = {
      cmd = { "hydra-lsp" },
      root_dir = lspconfig.util.root_pattern(".git"),
      filetypes = { "yaml" },
    },
  }
end

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "rust_analyzer",
    "bashls",
    "taplo",
  },
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      lspconfig.lua_ls.setup(lua_opts)
    end,
  },
})

local cmp = require("cmp")
local cmp_format = lsp_zero.cmp_format()

cmp.setup({
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "luasnip", group_index = 2 },
  },
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "bash", "rust", "cpp", "lua" },
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
  autotag = { enable = true },
})
