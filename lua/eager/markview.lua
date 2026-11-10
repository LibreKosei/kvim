local presets = require("markview.presets")

require("markview").setup({
    preview = {
        enable = false,
        icon_provider = "devicons",
    },
    markdown = {
        headings = presets.headings.arrowed,
        tables = presets.tables.single,
        block_quotes = presets.block_quotes.obsidian,
    },
})

vim.keymap.set("n", "<leader>mp", "<cmd>Markview toggle<cr>", { desc = "Markview: toggle preview" })
vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<cr>", { desc = "Markview: split preview" })
