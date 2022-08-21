return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim", opt = true })
    -- General
    use({ "kassio/neoterm", config = require("plug.neoterm").setup })
    use({ "folke/trouble.nvim", config = require("plug.trouble").setup, requires = { "kyazdani42/nvim-web-devicons" } })
    use({ "ful1e5/onedark.nvim", config = require("plug.onedark").setup })
    -- use {'AckslD/nvim-neoclip.lua'}
    use("EdenEast/nightfox.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require("plug.treesitter").setup })
    use({ "folke/which-key.nvim", config = require("plug.which-key").setup })
    -- copilot things
    -- The official plugin must have been used at least once
    use({ "github/copilot.vim",  })
    -- use {
    --     'samodostal/copilot-client.lua',
    --     requires = {
    -- 	'zbirenbaum/copilot.lua',
    -- 	'nvim-lua/plenary.nvim'
    --     },
    -- }
    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     module = "copilot_cmp",
    -- }
    -- BARS
    use({
	"nvim-lualine/lualine.nvim",
	config = require("plug.lualine").setup,
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({
	"romgrk/barbar.nvim",
	config = require("plug.barbar").setup,
	requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
	"max397574/better-escape.nvim",
	config = function()
	    require("plug.better_escape").setup()
	end,
    })
    use({
	"ggandor/lightspeed.nvim",
	config = function()
	    require("plug.lightspeed").setup()
	end,
    })
    use({ "ahmedkhalf/project.nvim", config = require("plug.project").setup })
    use({ "terrortylor/nvim-comment", config = require("plug.nvim-comment").setup })
    use({ "akinsho/toggleterm.nvim", config = require("plug.toggleterm").setup, branch = "main"})
    -- Git
    use({
	"lewis6991/gitsigns.nvim",
	requires = {
	    "nvim-lua/plenary.nvim",
	},
	config = require("plug/gitsigns").setup,
	-- tag = 'release' -- To use the latest release
    })
    use({
	"kyazdani42/nvim-tree.lua",
	requires = {
	    "kyazdani42/nvim-web-devicons", -- optional, for file icon
	},
	config = require("plug.nvim-tree").setup,
    })
    -- Autocomplete
    -- {
	use({
	    "hrsh7th/nvim-cmp",
	    config = require("plug.nvim-cmp").setup,
	    requires = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-omni",
	    },
	})
	use({ "L3MON4D3/LuaSnip", config = require("plug.luasnip").setup })
	-- lsp plugins
	use({
	    "neovim/nvim-lsp",
	    config = require("plug.lsp").setup,
	    requires = {
		"neovim/nvim-lspconfig",
		"nvim-lua/lsp-status.nvim",
		"onsails/lspkind-nvim",
		"~/dev/efm-generics",
	    },
	})
	use({ "simrat39/rust-tools.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim", config = require("plug.null-ls").setup })
	-- Planning
	use({ "vimwiki/vimwiki", config = require("plug.vimwiki").setup })
	-- telescope
	--
	use({
	    "nvim-telescope/telescope.nvim",
	    config = require("plug.telescope").setup,
	    requires = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
	    },
	})
	-- other
	use("lukas-reineke/indent-blankline.nvim")
	-- Language specific plugins:
	-- ledger
	use("ledger/vim-ledger")
	-- laTeX
	use({ "lervag/vimtex", config = require("plug.vimtex").setup })
	-- julia
	use("JuliaEditorSupport/julia-vim")
	-- Typescript
	use("HerringtonDarkholme/yats.vim")
	-- R
	use("jalvesaq/Nvim-R")
	-- use 'mfussenegger/nvim-dap'
	-- personal dev
	--[[ install these later when probably worked into routine
	--
	--
	-- REFACTOR --use 'kosayoda/nvim-lightbulb'
	use "tversteeg/registers.nvim"
	use 'milkypostman/vim-togglelist'
	use 'machakann/vim-sandwich'
	use 'romgrk/todoist.vim', { 'do': ':TodoistInstall' }
	use 'glacambre/firenvim'
	--]]
	--
	--[[ lookup what these actually does
	use 'junegunn/vim-slash'
	--]]
		end)
