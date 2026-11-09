return {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', '.git' },
    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
        nixpkgs = {
            expr = 'import (builtins.getFlake "github:LibreKosei/dots").inputs.nixpkgs {}',
        },
        options = {
            nixos = {
                expr = '(builtins.getFlake "github:LibreKosei/dots").nixosConfigurations.kosei.options',
            },
            home_manager = {
                expr = '(builtins.getFlake "github:LibreKosei/dots").homeConfigurations.kosei.options',
            },
        },
    }
}
