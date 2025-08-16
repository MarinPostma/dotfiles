# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:
{
  nix.settings.experimental-features = [ "nix-command"  "flakes" ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    openFirewall = true;
    ports = [22 4222];
  };

  users.users."adhoc".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH16lfhNcEXpLU59BNX+D0AW3yLTUqrdnSOPXc1383/T adhoc@adhocnixos" #laptop
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "adhoc" = import ./home.nix;
    };
  };

  security = {
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  services.xserver.enable = true; # Enable the X11 windowing system.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    config.common.default = "*";
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "adhocnixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adhoc = {
    isNormalUser = true;
    description = "adhoc";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];
    shell = pkgs.zsh;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # add dylibs here
    sqlite
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

  specialisation = {
    gaming.configuration = {
      environment.systemPackages = with pkgs; [
        mangohud
        protonup
        steam
        alacritty
        neovim
        jetbrains-mono
        git
        discord
      ];

      environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/adhoc/.steam/root/compatibilitytools.d";
      };

      services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
      };

      programs.steam.enable = true;
      programs.steam.gamescopeSession.enable = true;
      programs.gamemode.enable = true;
      programs.firefox.enable = true;

      services.xserver.enable = true; # optional
      services.displayManager.sddm.enable = true;
      services.displayManager.sddm.wayland.enable = true;
      services.desktopManager.plasma6.enable = true;
    };

    workstation.configuration = {
      imports = [
        ./workstation.nix
        ../desktop/nvidia.nix
      ];
    };
  };

}
