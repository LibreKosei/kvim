require("nvim-treesitter.config").setup({
    highlight = { enable = true },
    auto_install = false,
    sync_install = false,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "*" },
    callback = function ()
        pcall(vim.treesitter.start)
    end
})
