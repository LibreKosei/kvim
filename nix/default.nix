{ 
    wrapNeovimUnstable,
    neovim-unwrapped,
    stdenv,
    pkgs,
    lib,
    callPackage,
    root, # must be set to the project root!
    appName ? "kvim",
    withConfig ? true,
    extraPackages ? [],
}:
let
  rtp = callPackage ./rtp.nix { inherit root; };

  plugins = callPackage ./plugins {};

  buildInputs = with pkgs; [
      ripgrep
      nixfmt
      fzf
  ] ++ lib.optionals (extraPackages != []) extraPackages;
  
  initLua = ''
      vim.opt.rtp:prepend('${rtp}')
  ''
  + builtins.readFile (root + "/init.lua")
  + ''
      vim.opt.rtp:prepend('${rtp}/nvim')
      vim.opt.rtp:prepend('${rtp}/after')
  '';

  neovim-wrapped = wrapNeovimUnstable neovim-unwrapped {
      inherit plugins buildInputs;
      nativeBuildInputs = [ pkgs.makeWrapper ];

      luaRcContent = if withConfig then initLua else "";
      wrapRc = withConfig;
      wrapperArgs = [
          "--set" "NVIM_APPNAME" appName
      ] ++ lib.optionals withConfig [
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
