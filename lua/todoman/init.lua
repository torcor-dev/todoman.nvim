TODOMAN_CONFIG = require("todoman.config")

local utils = require("todoman.utils")
local templates = require("todoman.templates")
local todo_io = require("todoman.io")

local M = {}

M.setup = function(opts)
	opts = opts or {}
	TODOMAN_CONFIG.apply(opts)
end

local project_name = function()
	local cmd = { "git", "rev-parse", "--show-toplevel" }
	local cwd = vim.loop.cwd()
	local res, ret = utils.get_os_command_output(cmd, cwd)
	if ret ~= 0 then
		print("Not a git repo, using cwd instead")
		res = cwd
	else
		res = res[1]
	end
	return table.remove(vim.split(res, "/"))
end

local create_base = function(fn)
	vim.api.nvim_buf_set_lines(0, 0, -1, false, templates.base_file(fn))
end

local add_item = function(item)
	vim.api.nvim_buf_set_lines(0, -2, -1, false, { templates.todo_item(item) })
end

local place_cur = function()
	local h = vim.api.nvim_buf_line_count(0)
	local w = string.len(vim.api.nvim_buf_get_lines(0, h - 1, h, true)[1])
	vim.api.nvim_win_set_cursor(0, { h, w })
end

M.todo = function()
	local fp, exists = todo_io.get_fp(project_name())
	vim.cmd("edit " .. fp)
	if not exists then
		create_base(project_name())
		add_item("")
	end
	place_cur()
end

M.add = function(item)
	todo_io.add_item(project_name(), item)
	print("Added item to todo")
end

return M
