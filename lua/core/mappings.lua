require("core.alias")

vim.g.mapleader = " "

--Normal Mode
Nm("<leader>w", ":w<CR>")
Nm("<leader>e", ":Neotree filesystem reveal left focus<CR>")
Nm("<leader>o", ":Neotree filesystem reveal float focus<CR>")
Nm("<leader>g", ":Neotree float git_status<CR>")
Nm("<leader>/", ":CommentToggle<CR>")
Nm("<leader>x", ":Bdelete!<CR>")
Nm("<leader>X", ":BufferLinePickClose<CR>")
Nm("<leader>s", ":BufferLineSortByTabs<CR>")
Nm("<Tab>", ":BufferLineCycleNext<CR>")
Nm("<s-Tab>", ":BufferLineCyclePrev<CR>")

--movement
Nm("<C-h>", "<C-\\><C-n><C-w>h")
Nm("<C-j>", "<C-\\><C-n><C-w>j")
Nm("<C-k>", "<C-\\><C-n><C-w>k")
Nm("<C-l>", "<C-\\><C-n><C-w>l")
Nm("<C-q>", "<C-\\><C-n>:q<CR>")

--Terminal
Nm("<leader>h", ":lua Horizontal_term_toggle()<CR>")
Nm("<leader>v", ":lua Vertical_term_toggle()<CR>")
Nm("<leader>b", ":lua Float_term_toggle()<CR>")

--Insert Mode

--Visual Mode
Vm("<leader>/", ":CommentToggle<CR>")

--Terminal Mode
Tm("<C-h>", "<C-\\><C-n><C-w>h")
Tm("<C-j>", "<C-\\><C-n><C-w>j")
Tm("<C-k>", "<C-\\><C-n><C-w>k")
Tm("<C-l>", "<C-\\><C-n><C-w>l")
Tm("<C-q>", "<C-\\><C-n>:q<CR>")
