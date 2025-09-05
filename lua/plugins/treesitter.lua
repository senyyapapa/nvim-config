require 'nvim-treesitter.configs'.setup{
	ensure_installed = {"typescript", "vim", "lua", "go", "tsx", "javascript", "cpp"},

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}


