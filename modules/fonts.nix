{ pkgs, config, ... }:
{
  home.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    fira-code
  ];

  fonts.fontconfig = {
    enable = true;
  };
}
