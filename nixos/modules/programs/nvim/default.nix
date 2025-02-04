{ pkgs, lib, config, ... }:
{
    home.packages = with pkgs; [
      fzf
      fd
      ripgrep
    ];
    
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };

    xdg.configFile = {
      nvim = {
        source = ./config;
        recursive = true;
        force = true;
      };
  };
}
