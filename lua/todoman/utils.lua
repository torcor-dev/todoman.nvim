local Job = require("plenary.job")

local M = {}

M.get_os_command_output = function(cmd, cwd)
	local command = table.remove(cmd, 1)
	local stdout, ret = Job:new({
		command = command,
		args = cmd,
		cwd = cwd,
	}):sync()
	return stdout, ret
end

return M
