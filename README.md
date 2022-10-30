# todoman.nvim

Create / edit todo file for the current repository or directory, but store them away from git repos.

## Install

Packer: 
```lua
use({
    "torcor-dev/todoman.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
})
```

## Config

Default options: 
```lua
require("todoman").setup({
    filetype = {
        name = "markdown",
        suffix = ".md",
    },
    save_dir = vim.fn.stdpath("data") .. "/todoman/todos/", --$HOME/.local/share/nvim/todoman/todos/
})
```

## Usage

Edit todo-file:
```lua
require("todoman").todo()
```

Add item to todo-list:
```lua
require("todoman").add("your item")
```

Add Telescope pickers `(:Telescope todoman)` to browse all todo-files:
```lua
require("telescope").load_extension("todoman")
```
