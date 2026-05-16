{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }: 
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
            kvim = pkgs.callPackage ./default.nix {};
        in 
    {
        packages.x86_64-linux.default = pkgs.callPackage ./default.nix {};
        apps.${system}.default = {
            type = "app";
            program = "${kvim}/bin/kvim";
        };
    };
}
