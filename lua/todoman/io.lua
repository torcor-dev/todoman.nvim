local templates = require("todoman.templates")
local config = require("todoman.config")

local Path = require("plenary.path")

local M = {}

M.get_or_create_dir = function()
	local fp = Path:new(config.save_dir)
	if not fp:exists() then
		print("Creating dirs")
		fp:mkdir({ parents = true })
	end
	return fp
end

M.get_fp = function(project_name)
	local dir = M.get_or_create_dir()
	local fp = Path:new(dir, project_name) .. config.filetype.suffix
	local exists = vim.loop.fs_stat(fp)
	return fp, exists
end

M.create_base = function(project_name)
	local fp, exists = M.get_fp(project_name)
	if exists then
		return
	end

	local file = io.open(fp, "w")
	if file ~= nil then
		for _, line in ipairs(templates.base_file(project_name)) do
			if line == "" then
				file:write("\n")
			else
				file:write(line .. "\n")
			end
		end
		file:close()
	end
end

M.add_item = function(project_name, item)
	local fp, exists = M.get_fp(project_name)
	if not exists then
		M.create_base(project_name)
	end
	local file = io.open(fp, "a")
	if file ~= nil then
		file:write(templates.todo_item(item) .. "\n")
		file:close()
	end
end

return M
