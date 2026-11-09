--- core
require("options")
require("keybinds")
require("colorscheme")
require('autocmd')

--- Plugins
require("lz.n").load("plugins")
require('eager')

--- Language Server Protocols 
require("lsp")

--- Lua
vim.cmd.colorscheme("kanagawa")
