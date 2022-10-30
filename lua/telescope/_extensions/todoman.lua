return require("telescope").register_extension({
	setup = function(ext_config, config)
		-- access extension config and user config
	end,
	exports = {
		todoman = require("todoman.telescope_pickers").todo_file_picker,
		todo_files = require("todoman.telescope_pickers").todo_file_picker,
		--todo_items = require("todoman.telescope_pickers").todo_item_picker,
	},
})
