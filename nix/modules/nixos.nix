{ self }:
{ config, lib, pkgs, ... }:
let
  cfg = config.programs.kvim;
in
{
    options.programs.kvim = {
        enable = lib.mkEnableOption "kvim, a custom Neovim configuration";

        package = lib.mkOption {
            type = lib.types.package;
            default = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
            description = "The kvim package to install";
        };

        appName = lib.mkOption {
            type = lib.types.str;
            default = "kvim";
            description = "Name of the output binary and NVIM_APPNAME";
        };

        extraPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "Extra tools added to kvim's $PATH";
        };

        defaultEditor = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Set kvim as the default $EDITOR";
        };
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            (cfg.package.override {
                inherit (cfg) appName extraPackages;
             })
        ];

        environment.variables.EDITOR = lib.mkIf cfg.defaultEditor (lib.mkOverride 900 cfg.appName);
    };
}
