{ pkgs, system, ... }:
{
  programs.ghostty = {
    enable = true;
    package = if system == "aarch64-darwin" then null else pkgs.ghostty;
    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      window-decoration = system == "aarch64-darwin";
      theme = "catppuccin-mocha";
    };
  };
}
