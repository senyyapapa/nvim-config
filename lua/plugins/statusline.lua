require("slimline").setup({
	bold = true, -- makes primary parts bold

	-- Global style. Can be overwritten using `configs.<component>.style`
	spaces = {
		components = "─",
		left = "─",
		right = "─",
	},

	-- Inactive components
	-- Uses all `components` by default.
	-- E.g. for only showing `path`:
	-- components_inactive = {
	--   left = { 'path' },
	--   right = {},
	-- },
	components_inactive = {},

	-- Component configuration
	-- `<component>.style` can be used to overwrite the global 'style'
	-- `<component>.sep` can be used to overwrite the global 'sep.left' and `sep.right`
	-- `<component>.hl = { primary = ..., secondary = ...}` can be used to overwrite global ones
	-- `<component>.follow` can point to another component name to follow its style (e.g. 'progress' following 'mode' by default). Follow can be disabled by setting it to `false`
	-- `<component>.trunc_width` can be used to hide a component completely once the window width drops below that value
	configs = {
		mode = {
			verbose = false, -- Selects the `verbose` format
			hl = {
				normal = "Type",
				visual = "Keyword",
				insert = "Function",
				replace = "Statement",
				command = "String",
				other = "Function",
			},
			format = {
				["n"] = { short = " NORMAL" },
				["v"] = { short = " VISUAL" },
				["V"] = { short = " V-L" },
				["\22"] = { short = " V-B" },
				["s"] = { short = " SELECT" },
				["S"] = { short = " S-L" },
				["\19"] = { short = " S-B" },
				["i"] = { short = " INSERT" },
				["R"] = { short = " REPLACE" },
				["c"] = { short = " COMMAND" },
				["r"] = { short = " PROMPT" },
				["!"] = { short = " SHELL" },
				["t"] = { short = " TERMINAL" },
			},
		},
		path = {
			trunc_width = 60,
			directory = true, -- Whether to show the directory
			-- truncates the directory path. Can be disabled by setting `truncate = false`
			truncate = {
				chars = 1, -- number of characters for each path component
				full_dirs = 2, -- how many path components to keep unshortened
			},
			icons = {
				folder = " ",
				modified = "",
				read_only = "",
			},
		},
		git = {
			trunc_width = 120,
			icons = {
				branch = "",
				added = "+",
				modified = "~",
				removed = "-",
			},
		},
		diagnostics = {
			trunc_width = 75,
			workspace = false, -- Whether diagnostics should show workspace diagnostics instead of current buffer
			icons = {
				ERROR = " ",
				WARN = " ",
				HINT = " ",
				INFO = " ",
			},
			severity = {
				-- vim.diagnostic.SeverityFilter options
				min = vim.diagnostic.severity.HINT,
			},
			hl = {
				error = "DiagnosticError",
				warn = "DiagnosticWarn",
				hint = "DiagnosticHint",
				info = "DiagnosticInfo",
			},
		},
		filetype_lsp = {
			trunc_width = 95,
			-- Map lsp client names to custom names or ignore them by setting to `false`
			-- E.g. { ['tsserver'] = 'TS', ['pyright'] = 'Python', ['GitHub Copilot'] = false }
			map_lsps = {},
			lsp_sep = ",", -- separator between attached LSPs
		},
		selectioncount = {
			hl = {
				primary = "Special",
			},
			icon = "󰈈 ",
		},
		searchcount = {
			hl = {
				primary = "Special",
			},
			icon = " ",
			-- Options to be passed to vim.fn.searchcount, see :h searchcount
			options = {
				recompute = true,
			},
		},
		progress = {
			follow = "mode",
			column = false, -- Enables a secondary section with the cursor column
			icon = " ",
		},
		recording = {
			icon = " ",
			hl = {
				primary = "Special",
			},
		},
	},

	-- Spacing configuration
	spaces = {
		components = " ", -- string between components
		left = " ", -- string at the start of the line
		right = " ", -- string at the end of the line
	},

	-- Seperator configuartion
	sep = {
		hide = {
			first = false, -- hides the first separator of the line
			last = false, -- hides the last separator of the line
		},
		left = "", -- left separator of components
		right = "", -- right separator of components
	},

	-- Global highlights
	hl = {
		base = "Normal", -- highlight of the background
		primary = "Normal", -- highlight of primary parts (e.g. filename)
		secondary = "Comment", -- highlight of secondary parts (e.g. filepath)
	},

	-- Hide statusline on filetypes
	disabled_filetypes = {},
})
