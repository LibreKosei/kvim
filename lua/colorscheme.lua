local function match_colors(prefix)
    return vim.tbl_filter(function (name) 
        return name:match("^" .. prefix)
    end, vim.fn.getcompletion("", "color"))
end

require("lz.n").load {
    {
        "kanagawa.nvim",
        colorscheme = match_colors("kanagawa"),
    },
    {
        "vimplugin-everblush.nvim",
        colorscheme = "everblush"
    },
    {
        "tokyonight.nvim",
        colorscheme = match_colors("tokyonight"),
    },
    {
        "material.nvim",
        colorscheme = match_colors("material"),
    },
    {
        "nightfox.nvim",
        colorscheme = match_colors("fox"),
    },
    {
        "catppuccin-nvim",
        colorscheme = match_colors("catppuccin"),
    },
    {
        "onedarkpro.nvim",
        colorscheme = {
            "onedark",
            "onedark_dark",
            "onedark_vivid",
        },
    },
    {
        "gruvbox.nvim",
        colorscheme = {
            "gruvbox"
        },
    },
    {
        "everforest",
        colorscheme = {
              "everforest"
        },
    },
    {
        "bamboo.nvim",
        colorscheme = match_colors("bamboo"),
    },
    {
        "vimplugin-pastel.nvim",
        colorscheme = match_colors("pastel"),
    },
    {
        "vimplugin-one_monokai.nvim",
        colorscheme = {
            "one_monokai",
        },
    }
}
