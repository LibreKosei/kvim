require("nvim-treesitter.config").setup({
    highlight = { enable = true },
    auto_install = false,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'nix', 'lua', 'qml', 'hs', 'rs', 'sh' },
    callback = function ()
        vim.treesitter.start()
    end
})
