{ neovim-unwrapped, vimUtils, vimPlugins, wrapNeovimUnstable, fetchFromGitHub, lib, stdenv, pkgs}:
let 
    everblush-nvim = (vimUtils.buildVimPlugin {
        name = "everblush.nvim";
        src = fetchFromGitHub {
            owner = "Everblush";
            repo = "nvim";
            rev = "678f808d81801b983b6fb8296fb17ba1b2785d7c";
            hash = "sha256-1bX/wykK3/BKc1uRhRZD6QR/OezZY6XgyXg3a9UT3ec=";
        };
    });

    rtpSrc = lib.fileset.difference
        ./.
        (lib.fileset.unions [
            (lib.fileset.maybeMissing ./result)
            (lib.fileset.maybeMissing ./.git)
        ]);

    rtp = stdenv.mkDerivation {
        name = "nvim-rtp-dir";
        src = lib.fileset.toSource {
            root = ./.;
            fileset = rtpSrc;
        };
        buildPhase = ''
            mkdir -p $out/{nvim,lua}
            rm -f init.lua 
        '';
        installPhase = ''
            cp -r lua $out/lua 
            rm -r lua 
            if [ -d "after" ]; then 
                cp -r after $out/after 
                rm -r after 
            fi
            if [ ! -z "$(ls -A)" ]; then 
                cp -r -- * $out/nvim 
            fi
        '';
    }; 

    languageServers = with pkgs; [
        lua-language-server
        nixd
    ];
    
    initLua = 
        ''
            vim.opt.rtp:prepend('${rtp}/lua')
        ''
        + (builtins.readFile ./init.lua)
        + ''
            vim.opt.rtp:prepend('${rtp}/nvim')
            vim.opt.rtp:prepend('${rtp}/after')
        '';
in
    wrapNeovimUnstable neovim-unwrapped {
        plugins = with vimPlugins; [
            { plugin = nvim-tree-lua; optional = true; }
            { plugin = lz-n; optional = false; }
            { plugin = everblush-nvim; optional = false; }
            { plugin = lualine-nvim; optional = false; }
            { plugin = bufferline-nvim; optional = true; }
            
        ];
        luaRcContent = initLua;
        
        buildInputs = languageServers;
        nativeBuildInputs = [ pkgs.makeWrapper ];

        wrapperArgs = [
            "--set" "NVIM_APPNAME" "kvim"
        ] ++
        lib.optionals (languageServers != []) [
            "--prefix" "PATH" ":" (lib.makeBinPath languageServers)
        ];
    }
