require("options")

--------------------------------------           Plugins         ------------------------------------------
require("plugins.lualine")
require("plugins.oil")
require("plugins.bufferline")
require("plugins.which-key")
require("plugins.blink-cmp")
require("plugins.nvim-autopairs")
require("plugins.treesitter")
-------------------------------------- Language Server Protocols ------------------------------------------
require("lsp.lua_ls")
require("lsp.nixd")

--------------------------------------             Lua           ------------------------------------------
vim.cmd.colorscheme("everblush")
