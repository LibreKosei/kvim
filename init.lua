--- core
require("options")
require("keybinds")
require("colorscheme")

--- Plugins 
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.which-key")
require("plugins.blink-cmp")
require("plugins.nvim-autopairs")
require("plugins.treesitter")
require("plugins.toggleterm")
require("plugins.fzf")
require("plugins.nvim-tree")
require("plugins.gitsigns")


--- Language Server Protocols 
require("lsp.lua_ls")
require("lsp.nixd")
require('lsp.pyright')

--- Lua
vim.cmd.colorscheme("onedark")
