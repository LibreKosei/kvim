# My Neovim configuration managed by Nix.

To try it out without installing, 
```bash
nix run https://github.com/LibreKosei/kvim
```

To install, add the following to flake.nix
```nix
{
    inputs = {
        # ...
        kvim = {
            url = "github:LibreKosei/kvim";
            inputs.nixpkgs.follows = "nixpkgs"; # suppose you have the nixpkgs as one of the inputs already
        };
    };
}
```
Then
```nix
{ inputs, pkgs, ...}:
{
    home.packages = [
        inputs.kvim.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
```

---

Currently, the only tested architecture is x86_64, and as of now I am not planning to support others.


