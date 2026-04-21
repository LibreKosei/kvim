require("lz.n").load {
    {
        "nvim-tree.lua",
        keys = {
          { "<C-m>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        },
        after = function ()
            require("nvim-tree").setup({
                view = {
                    adaptive_size = true,
                },
                filters = {
                    custom = function (path)
                        local stats = vim.uv.fs_stat(path)
                        return stats and stats.type == "link"
                    end
                },
            })
        end
    }
}
