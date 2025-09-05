local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	-- размер терминала
	size = function(term)
		if term.direction == "horizontal" then
			return 15 -- 15 строк в высоту для горизонтального
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4 -- 40% ширины экрана для вертикального
		end
	end,
	open_mapping = [[<c-\>]], -- можешь изменить, это для входа в Normal mode в терминале
	hide_numbers = true, -- скрывать номера строк в окне терминала
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true, -- позволяет использовать <C-/> для выхода из insert mode
	persist_size = true,
	direction = "float", -- по умолчанию будет открываться плавающее окно, но мы это переопределим
	close_on_exit = true, -- закрывать окно, когда процесс в терминале завершается
	shell = vim.o.shell, -- использовать твой shell по умолчанию
	float_opts = {
		border = "curved", -- стиль рамки
		winblend = 0,
	},
	highlights = {
		Normal = {
			guibg = "#00000",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local horizontal_term = Terminal:new({
	direction = "horizontal",
	scope = "window",
	display_name = "Horizontal Term",
})

function Horizontal_term_toggle()
	horizontal_term:toggle()
end

-- Вертикальный терминал
local vertical_term = Terminal:new({
	direction = "vertical",
	display_name = "Vertical Term",
})

function Vertical_term_toggle()
	vertical_term:toggle()
end

--Модальное окно терминала
local float_term = Terminal:new({
	direction = "float",
	display_name = "Float Terminal",
})

function Float_term_toggle()
	float_term:toggle()
end
