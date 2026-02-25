require("lz.n").load {
    "nvim-tree/nvim-tree.lua",
    keys = {
        "<C-n>"
    },
    after = function ()
        require("nvim-tree").setup()
    end
}
