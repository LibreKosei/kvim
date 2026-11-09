{ lib, stdenv, root }:
let
    fileset = lib.fileset.difference
        root
        (lib.fileset.unions (map (p: lib.fileset.maybeMissing (root + "/${p}")) [
            "result"
            ".git"
            ".github"
            ".gitignore"
            "nix"
            "default.nix"
            "flake.nix"
            "flake.lock"
            "README.md"
        ]));
in
stdenv.mkDerivation {
    name = "nvim-rtp-dir";
    src = lib.fileset.toSource {
        inherit root fileset;
    };
    buildPhase = ''
        mkdir -p $out/{nvim,lua,after}
        rm -f init.lua 
    '';
    installPhase = ''
        if [ -d "lua" ]; then
            cp -r lua/. $out/lua/
            rm -r lua 
        fi
        
        if [ -d "after" ]; then 
            cp -r after/. $out/after/
            rm -r after 
        fi

        if [ ! -z "$(ls -A)" ]; then 
            cp -r -- * $out/nvim 
        fi
    '';
} 
