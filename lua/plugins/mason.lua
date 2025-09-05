local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls", -- LSP for Lua language
		"ts_ls", -- LSP for Typescript
		"cssls", -- LSP for CSS
		"pyright", -- LSP for Python
		"gopls", -- LSP for Go
	},
})
