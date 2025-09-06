require("nvim-ts-autotag").setup()
vim.lsp.handlers["textDocument/publisDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostic, {
	underline = true,
	virtual_text = { spacing = 5, severity_limit = "Warning" },
	update_in_insert = true,
})
