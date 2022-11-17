local util = require("util")

if util.is_root() or not util.has_neovim_v05() then
	return
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "plugins.lua" }
)

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PackerBootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- Color sheme
	use({
    "navarasu/onedark.nvim",
		config = function()
			require("plugins.theme")
		end,
	})
	-- Theme: icons
	use({
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("plugins.lsp")
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("ray-x/lsp_signature.nvim")
	use("simrat39/rust-tools.nvim")
	use("folke/lsp-colors.nvim")
	use("folke/trouble.nvim")

	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	-- Treesitter
	use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
		requires = {
		  "nvim-treesitter/nvim-treesitter-context",
		  "nvim-treesitter/nvim-treesitter-refactor",
    },
		config = function()
			require("plugins.treesitter")
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	})

	-- Toggle line/visual comment
	use({
		"b3nj5m1n/kommentary",
		opt = true,
		keys = { "gc", "gcc" },
		config = function()
			require("plugins.comments")
		end,
	})

	-- Git
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.neogit")
		end,
	})
	use("sindrets/diffview.nvim")
	use("rhysd/committia.vim")
	use("rhysd/conflict-marker.vim")
	-- Floating windows are awesome :)
	use({
		"rhysd/git-messenger.vim",
		keys = "<Plug>(git-messenger)",
	})
	-- Async signs!
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	})

	-- Tmux navigation
	use("christoomey/vim-tmux-navigator")

	-- Fuzzy finder
	use({ "junegunn/fzf", run = "./install --all" })
	use({ "junegunn/fzf.vim" })
	use({ "gfanto/fzf-lsp.nvim" })

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.statusline")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PackerBootstrap then
		require("packer").sync()
	end
end)
