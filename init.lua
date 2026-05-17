--- core
require("options")
require("keybinds")
require("colorscheme")
require('autocmd')

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
require('plugins.colorizer')
require('plugins.markview')


--- Language Server Protocols 
require("lsp.lua_ls")
require("lsp.nixd")
require('lsp.pyright')
require('lsp.rust_analyzer')
require('lsp.qmlls')

--- Lua
vim.cmd.colorscheme("everblush")
