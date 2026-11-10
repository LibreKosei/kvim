local function match_colors(prefix)
    return vim.tbl_filter(function (name) 
        return name:match("^" .. prefix)
    end, vim.fn.getcompletion("", "color"))
end

require("lz.n").load {
    {
        "kanagawa.nvim",
        colorscheme = {
            "kanagawa",
            "kanagawa-wave",
            "kanagawa-lotus",
            "kanagawa-dragon",
        },
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
        colorscheme = {
            "nightfox",
            "duskfox",
            "dayfox",
            "dawnfox",
            "nordfox",
            "telafox",
            "carbonfox",
        },
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
    },
    {
        "vimplugin-oldworld.nvim",
        colorscheme = { "oldworld" },
    },
    {
        "vimplugin-ember",
        colorscheme = match_colors("ember"),
    },
    {
        "embark-nvim",
        colorscheme = { "embark" },
    },
    {
        "edge",
        colorscheme = { "edge" },
    },
    {
        "vimplugin-shale.nvim",
        colorscheme = { "shale" },
    },
    {
        "evergarden-nvim",
        colorscheme = match_colors("evergarden"),
    },
    {
        "bluloco.nvim",
        colorscheme = match_colors("bluloco"),
    },
    {
        "oxocarbon.nvim",
        colorscheme = { "oxocarbon" },
    },
    {
        "neovim-ayu",
        colorscheme = match_colors("ayu"),
    },
    {
        "tokyodark.nvim",
        colorscheme = { "tokyodark" },
    },
    {
        "kanagawa-paper",
        colorscheme = { "kanagawa-paper", "kanagawa-paper-ink", "kanagawa-paper-canvas" },
    },
}

local state_file = vim.fn.stdpath("data") .. "/colorscheme"

local function read(sf)
    local f = io.open(sf, 'r')

    if not f then
        return nil
    end

    local name = f:read("*l")
    f:close()
    return name
end

local function write(name, file)
    local f = io.open(file, 'w')

    if f then
        f:write(name)
        f:close()
    end
end

local fallback = "catppuccin"
local saved = read(state_file)
local ok = saved and pcall(vim.cmd.colorscheme, saved)
if not ok then
    pcall(vim.cmd.packadd, fallback)
    pcall(vim.cmd.colorscheme, fallback)
end

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("kvim-colorscheme-persiste", { clear = true }),
    callback = function(ev) write(ev.match, state_file) end,
})
