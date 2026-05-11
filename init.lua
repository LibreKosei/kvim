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

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {})
    end
})

--- Lua
vim.cmd.colorscheme("onedark")
