{ pkgs, lib, config, xdg, ... }:
let
    cfg = config.programs.qute;
in {
  options = {
    programs.qute.enable = lib.mkEnableOption "qute";
  };

  config = lib.mkIf cfg.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = { DEFAULT = "https://google.com/search?q={}"; };
      settings = {
        content.javascript.clipboard = "access";
        colors.webpage.darkmode.enabled = true;
      };
    };
  };
}
