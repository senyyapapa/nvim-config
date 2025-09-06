vim.api.nvim_set_hl(0, "NeoTreePreviewBorder", { fg = "#4B5263" })
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
	open_at_startup = false,
	hide_numbers = true,
	enable_diagnostics = false,
	source_selector = {
		winbar = true,
		statusline = false,
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = {
		mappings = {
			-- ["p"] = {
			-- 	"toggle_preview",
			-- 	config = {
			-- 		use_float = true,
			-- 		use_image_nvim = true,
			-- 		use_snacks_image = true,
			-- 		title = "Neo-tree Preview",
			-- 	},
			-- },
			["c"] = "copy_to_clipboard",
			["<tab>"] = "next_source",
			["<S-tab>"] = "prev_source",

			["a"] = function(state)
				local tree = state.tree
				local node = tree:get_node()
				local dir_path = node.path
				if node.type ~= "directory" then
					dir_path = vim.fn.fnamemodify(node.path, ":h")
				end

				vim.ui.input({
					prompt = "New File/Folder: ",
					default = "",
					completion = "file",
				}, function(input)
					if not input then
						return
					end
					path_create = dir_path .. "/" .. input
					if input:sub(-1) == "/" then
						vim.fn.mkdir(path_create, "p")
					else
						vim.fn.writefile({}, path_create)
					end
					require("neo-tree.sources.manager").refresh("filesystem")
				end)
			end,

			["r"] = function(state)
				local node = state.tree:get_node()
				if not node then
					return
				end

				vim.ui.input({
					prompt = "New Name: ",
					default = node.path,
					completion = "file",
				}, function(input)
					if not input or input == node.path then
						return
					end
					vim.fn.rename(node.path, input)
					require("neo-tree.sources.manager").refresh("filesystem")
				end)
			end,

			["d"] = function(state)
				local node = state.tree:get_node()
				if not node then
					return
				end

				vim.ui.select({ "Yes", "No" }, {
					prompt = "Delete " .. node.path .. "?",
				}, function(choice)
					if not choice or choice == "No" then
						return
					end
					if node.type == "directory" then
						vim.fn.delete(node.path, "rf")
					else
						vim.fn.delete(node.path)
					end
					require("neo-tree.sources.manager").refresh("filesystem")
				end)
			end,
		},
	},
	components = {
		git_status = {
			symbols = {
				added = "",
				conflict = "",
				deleted = "",
				ignored = "",
				modified = "●",
				renamed = "",
				staged = "",
				unmerged = "",
				untracked = "",
			},
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				vim.wo.cursorline = true
				vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#4B5263" })
				vim.wo.winhighlight = "CursorLine:NeoTreeCursorLine"
			end,
		},
		{
			event = "neo_tree_buffer_leave",
			handler = function()
				vim.wo.cursorline = false
				vim.wo.winhighlight = ""
			end,
		},
	},
})
