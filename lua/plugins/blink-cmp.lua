require("lz.n").load {
    {
        "blink.cmp",
        event = "DeferredUIEnter",
        after = function ()
            require("blink.cmp").setup({
                keymap = {
                    ['<CR>'] = { 'accept', 'fallback' },
                    ['<Tab>'] = { 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' }
                },
            })
        end,
    }
}
