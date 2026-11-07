--- core
require("options")
require("keybinds")
require("colorscheme")
require('autocmd')

--- Plugins
require("lz.n").load("plugins")
require('earger')

--- Language Server Protocols 
require("lsp.lua_ls")
require("lsp.nixd")
require('lsp.pyright')
require('lsp.rust_analyzer')
require('lsp.qmlls')
require('lsp.markdown-oxide')
require('lsp.html')
require('lsp.cssls')
require('lsp.ts_ls')
require('lsp.hls')
require('lsp.latex')

--- Lua
vim.cmd.colorscheme("pasteldark")
