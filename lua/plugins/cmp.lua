local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- Luasnip expand
		end,
	},
window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
	-- Mappings for cmp
 mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" })
  }),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP
		{ name = "nvim_lsp_signature_help" }, -- LSP for parameters in functions
		{ name = "nvim_lua" }, -- Lua Neovim API
		{ name = "luasnip" }, -- Luasnip
		{ name = "buffer" }, -- Buffers
		{ name = "path" }, -- Paths
		{ name = "emoji" }, -- Emoji
	}, {}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- Show only symbol annotations
			maxwidth = 50, -- Prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		}),
	},
})

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- Настройка для командной строки
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
