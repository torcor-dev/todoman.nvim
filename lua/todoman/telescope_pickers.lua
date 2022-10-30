local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

local M = {}

M.todo_file_picker = function(opts)
	opts = opts or {}
	opts.search_dirs = { require("todoman.config").save_dir }
	opts.prompt_title = "Todo files"
	opts.entry_maker = function(entry)
		local name = table.remove(vim.split(entry, "/"))
		return {
			value = entry,
			display = name,
			ordinal = name,
			path = entry,
		}
	end
	return require("telescope.builtin").find_files(opts)
end

return M
