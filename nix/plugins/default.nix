{ callPackage }:
builtins.concatLists (map (f: callPackage f { }) [
    ./colorschemes.nix
    ./core.nix
    ./editing.nix
])
