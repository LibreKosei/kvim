vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    -- on_attach = function(client, bufnr)
    --     vim.lsp.completion.enable(true, client.id, bufnr, {
    --         autotrigger = true,
    --         convert = function(item)
    --             return { abbr = item.label:gsub('%b()', '') }
    --         end,
    --     })
    -- end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                library = {
                    vim.env.KVIM_RUNTIME .. "/lua",
                    vim.env.KVIM_RUNTIME .. "/nvim",
                    vim.env.KVIM_RUNTIME .. "/after"
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function ()
        vim.lsp.enable("lua_ls")
    end
})
