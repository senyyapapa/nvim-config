vim.opt.termguicolors = true
vim.cmd([[colorscheme kanagawa]])

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE" })

-- function SetColor(color)
-- 	--color = color
-- 	--vim.cmd.colorscheme(color)
-- 	vim.cmd.transparency = true
--
-- 	vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE }) --transparent
-- 	--vim.api.nvim_set_hl(0, "Normal", { bg = "#120E27" })
-- 	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0E0A23" })
-- 	--vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
-- 	--vim.api.nvim_set_hl(0, "LinerNr", { bg = "none" })
-- end
--
-- SetColor()
