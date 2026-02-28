require("lz.n").load {
    "togglerterm.nvim",
    keys = {
      { "<A-h>", "<CMD>ToggleTerm direction=horizontal<CR>", desc = "ToggleTerm"}
    },
    after = function ()
        require("toggleterm").setup({})
    end
}
