# My Neovim configuration managed by Nix.

To try it out without installing, 
```bash
nix run https://github.com/LibreKosei/kvim
```

To install, add the following to `flake.nix`
```nix
{
    inputs = {
        # ...
        kvim.url = "github:LibreKosei/kvim";
    };

    outputs = { self, kvim, ...}@inputs:
    let
        system = "x64_64-linux";
        lib = nixpkgs.lib;
    in {
        nixosConfigurations.<your-username> = {
            # snippets
            modules = [ kvim.nixosModules.default ];
        };
    };
}
```

Then
```nix configuration.nix
{ inputs, pkgs, ...}:
{
    programs.kvim = {
        enable = true;
        appName = "kvim"; # Replace with your favorite name to override the binary name
        extraPackages = with pkgs; [
            lua-language-server
            nixd
            markdown-oxide
        ]; # packages to be added to kvim's $PATH
    };
}
```

> [!INFO]
> Currently, the only tested architecture is x86_64, and I am not planning to support others.
