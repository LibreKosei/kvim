require("lz.n").load {
    {
        "nvim-colorizer.lua",
        event = "DeferredUIEnter",
        after = function ()
            require("colorizer").setup({})
        end,
    }
}

