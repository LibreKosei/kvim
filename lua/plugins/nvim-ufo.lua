return {
    { "promise-async", dep_of = "nvim-ufo" },
    {
        "nvim-ufo",
        ft = { "*" },
        keys = {
            { "zR", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
            { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
        },
        after = function()
            require("ufo").setup({
                provider_selector = function()
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },
})
