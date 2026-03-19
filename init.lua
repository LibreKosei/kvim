--- core
require("options")
require("keybinds")
require("colorscheme")
--- Plugins 
require("plugins.lualine")
require("plugins.oil")
require("plugins.bufferline")
require("plugins.which-key")
require("plugins.blink-cmp")
require("plugins.nvim-autopairs")
require("plugins.treesitter")
require("plugins.toggleterm")
--- Language Server Protocols 
require("lsp.lua_ls")
require("lsp.nixd")

--- Lua
vim.cmd.colorscheme("everblush")
