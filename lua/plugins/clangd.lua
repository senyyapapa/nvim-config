function configure_cmake()
	local project_root = vim.fn.getcwd()
	local build_dir = project_root .. "/build"
	local command = string.format(
		"cmake -S %s -B %s -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && ln -sf %s/compile_commands.json %s",
		project_root,
		build_dir,
		build_dir,
		project_root
	)

	vim.notify("Starting CMake configuration...", vim.log.levels.INFO, { title = "CMake" })

	vim.fn.jobstart({ "bash", "-c", command }, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("CMake configuration complete!", vim.log.levels.INFO, { title = "CMake" })
			else
				vim.notify("CMake configuration failed! Exit code: " .. code, vim.log.levels.ERROR, { title = "CMake" })
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 1 and data[1] ~= "" then
				vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR, { title = "CMake Error" })
			end
		end,
	})
end
