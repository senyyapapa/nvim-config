local g = vim.g
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.tabstop = 2

vim.opt.fillchars = {
	stl = "─",
	eob = " ",
}
vim.o.laststatus = 3
vim.o.clipboard = "unnamedplus"
