vim.api.nvim_create_autocmd("FileType", {
    pattern = "rs",
    callback = function ()
        vim.lsp.enable("rust_analyzer")
    end
})
