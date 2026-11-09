{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }: 
        let
            systems = [ "x86_64-linux" ];
            forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
            pkgsFor = system: import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in 
    {
        packages = forAllSystems (system: 
            let 
                pkgs = pkgsFor system;
                kvim = pkgs.callPackage ./nix { 
                    root = ./.;
                    extraPackages = with pkgs; [ lua-language-server ];
                };
            in { default = kvim; }
        );

        apps = forAllSystems (system: {
            default = {
                type = "app";
                program = "${self.packages.${system}.default}/bin/kvim";
            };
        });

        overlays.default = final: prev: {
            kvim = final.callPackage ./nix { root = ./.; };
        };

        nixosModules.default = import ./nix/modules/nixos.nix { inherit self; };
    };
}
