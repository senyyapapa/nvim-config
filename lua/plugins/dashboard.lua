local function default_header()
	return {
		"███████╗███████╗███╗   ██╗██╗   ██╗ █████╗ ██████╗  █████╗ ██████╗  █████╗",
		"██╔════╝██╔════╝████╗  ██║██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗",
		"███████╗█████╗  ██╔██╗ ██║██║   ██║███████║██████╔╝███████║██████╔╝███████║",
		"╚════██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██╔══██║██╔═══╝ ██╔══██║██╔═══╝ ██╔══██║",
		"███████║███████╗██║ ╚████║ ╚████╔╝ ██║  ██║██║     ██║  ██║██║     ██║  ██║",
		"╚══════╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝",
	}
end

require("dashboard").setup({
	theme = "doom",
	config = {
		header = default_header(),
		center = {
			{
				icon = "󰙅 ",
				icon_hl = "Title",
				desc = "Open tree",
				desc_hl = "String",
				key = "e",
				keymap = "SPC e",
				key_hl = "Number",
				action = ":Neotree float",
			},
			-- остальные элементы
		},
		footer = {},
	},
})

-- Принудительный показ при запуске
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if #vim.fn.argv() == 0 then
			require("dashboard").start()
		end
	end,
})
