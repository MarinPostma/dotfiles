{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
    xh
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

  # services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
      "builders-use-substitutes" = true;
      "allow-import-from-derivation" = true;
    };
  };


  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true;  # default shell on catalina
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup ="uninstall";
      upgrade=true;
    };

    casks = [
      "1password"
      "arc"
      "raycast"
      "discord"
      "spotify"
      "karabiner-elements"
      "insomnia"
      "mongodb-compass"
      "linear-linear"
      "postman"
      "ghostty"
      "remarkable"
      "amethyst"
    ];
  };
}
