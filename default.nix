{ neovim-unwrapped, vimUtils, vimPlugins, wrapNeovimUnstable, fetchFromGitHub, lib, stdenv, pkgs}:
let 
    appName = "kvim";
    everblush-nvim = (vimUtils.buildVimPlugin {
        name = "everblush.nvim";
        src = fetchFromGitHub {
            owner = "Everblush";
            repo = "nvim";
            rev = "678f808d81801b983b6fb8296fb17ba1b2785d7c";
            hash = "sha256-1bX/wykK3/BKc1uRhRZD6QR/OezZY6XgyXg3a9UT3ec=";
        };
    });

    pastel-nvim = (vimUtils.buildVimPlugin {
        name = "pastel.nvim";
        src = fetchFromGitHub {
            owner = "ankushbhagats";
            repo = "pastel.nvim";
            rev = "c2423b7c391cf49c8eab39a6e0e3770a49e01f22";
            hash = "sha256-bFIsCidLfHkJ6Ir4BElKBvVPeuJS+/S00A/tTYNYY60=";
        };
    });

    one-monokai-nvim = (vimUtils.buildVimPlugin {
        name = "one_monokai.nvim";
        src = fetchFromGitHub {
            owner = "cpea2506";
            repo = "one_monokai.nvim";
            rev = "903b3e8923d67d3ee4b67f462b2b112012d7a69d";
            hash = "sha256-D2g8YmIQOc7tJpXs44riaLru2ogNsJhG+3EUcVfQ23A=";
        };
    });

    rtpSrc = lib.fileset.difference
        ./.
        (lib.fileset.unions [
            (lib.fileset.maybeMissing ./result)
            (lib.fileset.maybeMissing ./.git)
            (lib.fileset.maybeMissing ./.github)
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
        rust-analyzer
        pyright
        markdown-oxide
        kdePackages.qtdeclarative
        svelte-language-server
        vscode-langservers-extracted
        typescript-language-server
        haskell-language-server
        texlab
    ];

    ts-plugin = vimPlugins.nvim-treesitter.withPlugins (p: 
        [
            p.c 
            p.rust 
            p.nix 
            p.lua 
            p.python
            p.markdown
            p.markdown_inline
            p.html
            p.latex 
            p.yaml
            p.typst
            p.haskell
        ]
    );
    
    initLua = 
        ''
            vim.opt.rtp:prepend('${rtp}/lua')
        ''
        + (builtins.readFile ./init.lua)
        + ''
            vim.opt.rtp:prepend('${rtp}/nvim')
            vim.opt.rtp:prepend('${rtp}/after')
        '';

    neovim-wrapped = wrapNeovimUnstable neovim-unwrapped rec {
        plugins = with vimPlugins; [
            # Necessary
            { plugin = lz-n; optional = false; }
            { plugin = lualine-nvim; optional = false; }
            { plugin = bufferline-nvim; optional = true; }
            { plugin = nvim-autopairs; optional = true; }
            { plugin = which-key-nvim; optional = true; }
            { plugin = blink-cmp; optional = true; }
            { plugin = toggleterm-nvim; optional = true; }
            { plugin = fzf-lua; optional = true; }
            { plugin = nvim-tree-lua; optional = true; }
            { plugin = nvim-web-devicons; optional = false; }
            { plugin = gitsigns-nvim; optional = true; }
            { plugin = nvim-colorizer-lua; optional = true; } 
            { plugin = markview-nvim; optional = true; }
            { plugin = obsidian-nvim; optional = true; }
            { plugin = vimtex; optional = true; }
            { plugin = luasnip; optional = false; }
            { plugin = friendly-snippets; optional = false; }

            # nvim-treesitter
            { plugin = ts-plugin; optional = false; }
            { plugin = nvim-treesitter-context; optional = true; }

            # colorscheme
            { plugin = everblush-nvim; optional = true; }
            { plugin = everforest; optional = true; }
            { plugin = onedark-nvim; optional = true; }
            { plugin = kanagawa-nvim; optional = true; }
            { plugin = tokyonight-nvim; optional = true; }
            { plugin = material-nvim; optional = true; }
            { plugin = nightfox-nvim; optional = true; }
            { plugin = catppuccin-nvim; optional = true; }
            { plugin = onedarkpro-nvim; optional = true; }
            { plugin = gruvbox-nvim; optional = true; }
            { plugin = bamboo-nvim; optional = true; }
            { plugin = pastel-nvim; optional = true; }
            { plugin = one-monokai-nvim; optional = true; }
        ];

        luaRcContent = initLua;
        
        buildInputs = languageServers ++ 
            [ 
                pkgs.ripgrep
                pkgs.nixfmt
                pkgs.fzf
                pkgs.ghc
                pkgs.texlivePackages.latexmk
            ];

        nativeBuildInputs = [ pkgs.makeWrapper ];

        wrapperArgs = [
            "--set" "NVIM_APPNAME" "kvim"
            "--set" "KVIM_RUNTIME" "${rtp}"
        ] ++
        lib.optionals (languageServers != []) [
            "--prefix" "PATH" ":" (lib.makeBinPath buildInputs)
        ];

        withNodeJs = true;
        withPython3 = true;
    };
in 
    neovim-wrapped.overrideAttrs (oa: {
        buildPhase = oa.buildPhase + ''
            mv $out/bin/nvim $out/bin/${lib.escapeShellArg appName}
        '';
    })
