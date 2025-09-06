local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			require("plugins.neoTree")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"sschleemilch/slimline.nvim",
		opts = {},
		config = function()
			require("plugins.statusline")
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		keys = {
			{ "g.", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
			{ "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover information" },
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to declaration" },
		},
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.mason")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Configure diagnostics UI
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
			})

			-- Add icons for diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"onsails/lspkind-nvim",
		config = function()
			require("plugins.lspkind")
		end,
	},
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = master,
		lazy = false,
		build = ":TSUpdate",
	},
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{
		"Djancyp/custom-theme.nvim",
		config = function()
			require("custom-theme").setup()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "terrortylor/nvim-comment" },
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("plugins.conform")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				backend = "builtin",
				builtin = {
					relative = "win", -- 'win', 'cursor', 'editor'
					style = "minimal",
					border = "rounded", -- 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
					row = 0,
					col = 0,
					width = 0.5, -- 50% ширины окна
					height = 0.2, -- 20% высоты окна
				},
			},
		},
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "famiu/bufdelete.nvim" },
	{
		"Exafunction/codeium.vim", -- Официальный плагин
		lazy = false, -- Загружать только при входе в insert-режим
		config = function()
			-- Настройки (опционально)
			vim.g.codeium_disable_bindings = 1 -- Отключить стандартные клавиши (если хотите свои)
			vim.g.codeium_no_map_tab = 1 -- Не перехватывать Tab (чтобы не конфликтовал с другими плагинами)
			vim.g.codeium_enabled = 1
			vim.g.codeium_manual = 0
			vim.g.codeium_idle_delay = 100
			vim.keymap.set("i", "<D-l>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-i>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-o>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("plugins.lint")
		end,
	},
})
