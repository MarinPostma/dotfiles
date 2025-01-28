# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./../../modules/desktop/hyperland
    ];

  nix.settings.experimental-features = [ "nix-command"  "flakes" ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.logind.extraConfig = ''
    IdleAction=suspend
    IdleActionSec=1m
  '';

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=1h
    AllowSuspend=yes
  '';

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/adhoc/dotfiles/nixos/";
    };
    thunar.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    _1password.enable = true;
    _1password-gui.enable = true;
  };

  services.tailscale.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "adhoc" = import ./home.nix;
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "adhoc";
      };
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
  };


  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    fira-code
  ];

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

  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    edk2
    brave
    gdb
    neovim
    steam
    jq
    wget
    alacritty
    git
    rustup
    obsidian
    gcc
    clang
    zig
    gnumake
    fzf
    ripgrep
    fd
    discord
    spotify
    xclip
    xsel
    egl-wayland
    nixd
    lsd
    bat
    htop
    mold
    gh
    jetbrains-mono
    sqlite
    sqlite.dev
    zathura
    zulip
    exercism
    pkg-config
    openssl
    arandr
  ];

  programs.noisetorch.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # add dylibs here
    sqlite
  ];


  system.stateVersion = "24.11"; # Did you read the comment?
}
