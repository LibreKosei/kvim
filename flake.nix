{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { nixpkgs }: 
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            kvim = pkgs.callPackage ./default.nix {};
        in 
    {
        packages.x86_64-linux.default = pkgs.callPackage ./default.nix {};
        apps.${system}.default = {
            type = "app";
            program = "${kvim}/bin/nvim";
        };
    };
}
