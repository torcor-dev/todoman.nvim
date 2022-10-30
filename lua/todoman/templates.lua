local config = require("todoman.config")

local M = {}

local templates = {
	markdown = {
		h1 = "# Todo %s",
		h2_do = "## Do:",
		item = "- [ ] %s",
	},
	unknown = {
		h1 = "Todo %s",
		h2_do = "Do:",
		item = "- %s",
	},
}

local ftmpl = function(ftype)
	local tmpl = templates[ftype]
	if not tmpl then
		tmpl = templates.unknown
	end
	return tmpl
end

M.base_file = function(title)
	local tmpl = ftmpl(config.filetype.name)
	return { string.format(tmpl.h1, title), "", tmpl.h2_do, "" }
end

M.todo_item = function(item)
	local tmpl = ftmpl(config.filetype.name)
	return string.format(tmpl.item, item)
end

return M
