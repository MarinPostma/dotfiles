{ pkgs, inputs, system, ... }:
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
    settings = {
      UseDns = true;
      PasswordAuthentication = false;
    };
    openFirewall = true;
    ports = [22 4222];
  };

  users.users."adhoc".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH16lfhNcEXpLU59BNX+D0AW3yLTUqrdnSOPXc1383/T adhoc@adhocnixos" #laptop
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs system; };
    users = {
      "adhoc" = { ... }: {
        imports = [ ./.. ];
        home.username = "adhoc";
        home.homeDirectory = "/home/adhoc";
        home.stateVersion = "24.11"; # Please read the comment before changing.

        programs.home-manager.enable = true;
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
  services.pulseaudio.enable = false;
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
  programs.zsh.enable = true;

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

  services.tailscale.enable = true;

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/adhoc/dotfiles/";
    };
    thunar.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    _1password.enable = true;
    _1password-gui.enable = true;
    noisetorch.enable = true;
  };

  environment.defaultPackages = with pkgs; [
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
    gnumake
    discord
    spotify
    xclip
    xsel
    egl-wayland
    nixd
    bat
    htop
    mold
    zathura
    zulip
    pkg-config
    openssl
    arandr
    perl
    linuxPackages_latest.perf
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
