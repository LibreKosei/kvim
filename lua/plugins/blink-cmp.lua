return {
    "blink.cmp",
    event = "InsertEnter",
    after = function ()
        require("blink.cmp").setup({
            keymap = {
                preset = 'default',
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            completion = {
                menu = {
                    auto_show = false,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
            },
            snippets = {
                preset = 'luasnip',
            },
            sources = {
                default = { "lsp", "path", "snippets", },
            },
        })
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
    end,
}
