{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
    nodejs
    pnpm
    pkg-config
  ];

  system = {
    stateVersion = 6;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    defaults = {
      NSGlobalDomain = {
        KeyRepeat = 1;
        InitialKeyRepeat = 10;
        AppleInterfaceStyle = "Dark";
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
      };

      dock.autohide = true;
    };
  };

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

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "raycast"
      "discord"
      "qutebrowser"
      "spotify"
      "karabiner-elements"
    ];
  };
}
