{ vimPlugins }:
with vimPlugins; [
    { plugin = luasnip;             optional = false; }
    { plugin = friendly-snippets;   optional = false; }
    { plugin = nvim-autopairs;      optional = true; }
    { plugin = blink-cmp;           optional = true; }
    { plugin = markview-nvim;       optional = false; }
    { plugin = nvim-ufo;            optional = true; }
    { plugin = promise-async;       optional = true; }
]
