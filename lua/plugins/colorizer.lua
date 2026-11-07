return {
    "nvim-colorizer.lua",
    event = "BufReadPost",
    after = function ()
        require("colorizer").setup({
            filetypes = {
                "!TelescopePrompt",
                "!TelescopeResults",
                "!NvimTree",
            },
            mode = 'virtualtext',
          })
    end,
}
