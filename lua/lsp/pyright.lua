vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'py',
    callback = function ()
        vim.lsp.enable('pyright')
        vim.treesitter.start()
    end
})
