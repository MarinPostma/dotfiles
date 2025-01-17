{ pkgs, lib, config, ... }:

let
    cfg = config.programs.p10k;
    zsh = config.programs.zsh.enable;
in {
    _file = ./default.nix;

    options = {
        programs.p10k.enable = lib.mkEnableOption "p10k";
    };

    config = lib.mkIf (cfg.enable && zsh) {
        programs.zsh.plugins = [
            {
                name = "powerlevel10k-config";
                src = ./p10k-config;
                file = ".p10k.zsh";
            }
            {
                name = "zsh-powerlevel10k";
                src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
                file = "powerlevel10k.zsh-theme";
            }
        ];
    };
}
