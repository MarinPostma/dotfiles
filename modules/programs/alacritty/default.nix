{pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        size = 13.0;
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
        };
      };
    };
  };
}
