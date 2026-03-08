require("lz.n").load {
    "toggleterm.nvim",
    keys = {
      { "<A-h>", "<CMD>ToggleTerm direction=horizontal<CR>", desc = "ToggleTerm open horizontally" },
      { "<A-v>", "<CMD>ToggleTerm direction=vertical<CR>", desc = "ToggleTerm open vertically" }
    },
    after = function ()
        require("toggleterm").setup({})
        vim.keymap.set("t", "<A-h>", function ()
            local e = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
            vim.fn.feedkeys("exit" .. e, "t")
        end)
    end
}
