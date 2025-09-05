vim.opt.termguicolors = true
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,
		themable = true,
		close_command = "Bdelete! %d",
		buffer_close_icon = "󰅖",
		modified_icon = "● ",
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Exlporer",
				separator = true,
				padding = 1,
			},
		},
		diagnostics = "nvim_lsp",
		indicator = {
			icon = "  ",
			style = "icon",
		},
		separator_style = "slope",
	},
})
