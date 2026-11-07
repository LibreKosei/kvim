{ vimPlugins, callPackage }:
let
  custom = callPackage ./custom.nix {};
in
with vimPlugins; [
    { plugin = everforest;          optional = true; }
    { plugin = onedark-nvim;        optional = true; }
    { plugin = kanagawa-nvim;       optional = true; }
    { plugin = tokyonight-nvim;     optional = true; }
    { plugin = material-nvim;       optional = true; }
    { plugin = nightfox-nvim;       optional = true; }
    { plugin = catppuccin-nvim;     optional = true; }
    { plugin = onedarkpro-nvim;     optional = true; }
    { plugin = gruvbox-nvim;        optional = true; }
    { plugin = bamboo-nvim;         optional = true; }
    { plugin = oxocarbon-nvim;      optional = true; }
    { plugin = edge;                optional = true; }
    { plugin = bluloco-nvim;        optional = true; }
    { plugin = embark-vim;          optional = true; }
    { plugin = evergarden-nvim;     optional = true; }

    # color schemes which are not packaged yet
    { plugin = custom.everblush;    optional = true; }
    { plugin = custom.pastel;       optional = true; }
    { plugin = custom.one-monokai;  optional = true; }
    { plugin = custom.oldworld;     optional = true; }
    { plugin = custom.ember;        optional = true; }
    { plugin = custom.shale;        optional = true; }
]
