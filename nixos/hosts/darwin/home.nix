{ config, pkgs, ... }:
{
  imports = [
    ./../../modules
  ];
  home.username = "mpostma";
  # home.homeDirectory = "/Users/mpostma/";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # programs.ghostty = {
  #   enable = true;
  #   settings = {
  #     font-family = "JetBrainsMono Nerd Font Mono";
  #     window-decoration = false;
  #     theme = "catppuccin-mocha";
  #   };
  # };
}
