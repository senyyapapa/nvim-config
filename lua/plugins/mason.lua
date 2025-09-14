local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"cssls",
		"pyright",
		"gopls",
		"pbls",
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	},
})

lspconfig.ts_ls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

lspconfig.clangd.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	filetypes = { "c", "cpp" },
	cmd = {
		"clangd",
		"-extra-arg",
		"-I/usr/local/lib/wx/include/osx_cocoa-unicode-3.3",
		"-extra-arg",
		"-I/usr/local/include/wx-3.3",
		"-extra-arg",
		"-D_FILE_OFFSET_BITS=64",
		"-extra-arg",
		"-DwxDEBUG_LEVEL=0",
		"-extra-arg",
		"-DWXUSINGDLL",
		"-extra-arg",
		"-D__WXMAC__",
		"-extra-arg",
		"-D__WXOSX__",
		"-extra-arg",
		"-D__WXOSX_COCOA__",
	},
})
