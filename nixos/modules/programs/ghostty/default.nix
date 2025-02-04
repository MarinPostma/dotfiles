{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      window-decoration = false;
      theme = "catppuccin-mocha";
    };
  };
}
