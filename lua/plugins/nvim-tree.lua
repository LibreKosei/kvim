require("lz.n").load {
    {
        "nvim-tree.lua",
        keys = {
          { "<C-n>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        },
        after = function ()
            require("nvim-tree").setup({
                view = {
                    adaptive_size = true,
                },
            })
        end
    }
}
