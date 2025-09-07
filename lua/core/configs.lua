local g = vim.g
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

vim.opt.fillchars = {
	stl = "─",
	eob = " ",
}
vim.o.laststatus = 3
vim.o.clipboard = "unnamedplus"

-- Set filetype for protobuf files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.proto",
  command = "set filetype=proto",
})