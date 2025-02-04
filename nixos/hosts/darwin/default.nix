{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true;  # default shell on catalina
  };

  system.stateVersion = 4;

  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    fira-code
  ];

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "ghostty"
    ];
  };
}
