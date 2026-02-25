{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }: 
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            kvim = pkgs.callPackage ./nvim.nix {};
        in 
    {
        packages.x86_64-linux.default = pkgs.callPackage ./nvim.nix {};
        apps.${system}.default = {
            type = "app";
            program = "${kvim}/bin/nvim";
        };
    };
}
