# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./../hardware-configuration.nix
    ];

  networking.hostName = "adhocnixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.noisetorch.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  programs.firefox.enable = true;

  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.zsh.enable = true;

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

  users.users.adhoc = {
    isNormalUser = true;
    description = "adhoc";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      #  thunderbird
    ];
  };


  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/adhoc/.steam/root/compatibilitytools.d";
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}

