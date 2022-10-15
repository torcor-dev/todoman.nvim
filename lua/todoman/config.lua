local M = {}

M.filetype = { name = "markdown", suffix = ".md" }
M.save_dir = vim.fn.stdpath("data") .. "/todoman/todos"

M.apply = function(opts)
	for key, value in pairs(opts) do
		M[key] = value
	end
end

return M
