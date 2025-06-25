return {
  -- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

  -- LSP Support
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
  },
  { "williamboman/mason-lspconfig.nvim" },
  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "gq",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfmt" },
        python = { "isort", "black" },
        bash = { "shfmt" },
        rust = { "rust_analyzer" },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        isort = {
          prepend_args = { "--float-to-top" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function(_, opts)
      require("lsp_signature").setup(opts)
      local status_ok, sig = pcall(require, "lsp_signature")
      if not status_ok then
        return
      end

      local my_opts = {
        extra_trigger_chars = { "(", "," },
        auto_close_after = 5,
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        hint_prefix = " ",
        hi_parameter = "Search", -- LSP did not work reliably
        zindex = 202, -- by default it will be on top of all floating windows, set to 50 send it to bottom
        padding = "",
      }
      for k, v in pairs(my_opts) do
        opts[k] = v
      end
      sig.setup(opts)
    end,
  },
}
