vim.lsp.config("*", {
    root_markers = { ".git" },
})

local servers = {
    "lua_ls",
    "nixd",
    "rust_analyzer",
    "pyright",
    "markdown_oxide",
    "svelte",
    "cssls",
    "html",
    "jsonls",
    "hls",
    "ts_ls",
}

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kvim-lsp-attach", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, "Format")

        if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
    end,
})

vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})
