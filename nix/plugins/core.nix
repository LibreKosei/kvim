{ vimPlugins }:
with vimPlugins; [
    { plugin = lz-n;                            optional = false; }
    { plugin = lualine-nvim;                    optional = false; }
    { plugin = bufferline-nvim;                 optional = true; }
    { plugin = which-key-nvim;                  optional = true; }
    { plugin = toggleterm-nvim;                 optional = true; }
    { plugin = fzf-lua;                         optional = true; }
    { plugin = nvim-tree-lua;                   optional = true; }
    { plugin = nvim-web-devicons;               optional = false; }
    { plugin = gitsigns-nvim;                   optional = true; }
    { plugin = nvim-colorizer-lua;              optional = true; }

    { plugin = nvim-treesitter.withAllGrammars; optional = false;}
];
