# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
	imports = [
		(import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
	];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;
  boot.kernel.sysctl."kernel.perf_event_paranoid" = 1; # required for perf
  boot.blacklistedKernelModules = lib.mkIf (config.networking.hostName == "nixosDesk") ["i915"];
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2 swap_opt_cmd=1
  '';

  boot.kernelModules = [
    "i2c_designware_pci"
    "i2c_designware_platform"
    "i2c_designware_core"
    "i2c_dev"
    "i2c_i801"
    "xf86-input-libinput"
  ];

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.dhcpcd.enable = true;
  networking.dhcpcd.allowInterfaces = ["en*" "wlp*"];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };
  #

  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  # Enable the X11 windowing system.
  programs.light.enable = true;
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    videoDrivers = lib.mkIf (config.networking.hostName == "nixosDesk") ["nvidia"];
    desktopManager.xterm.enable = false;
    libinput.mouse.accelSpeed = "-1.0";
    libinput.mouse.accelProfile = "flat";
    layout = "us";
    xkbOptions = "caps:swapescape";
    displayManager.defaultSession = "none+xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    synaptics.enable = true;
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "cargo" "ssh-agent"];
  };

  # Configure keymap in X11

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.mpostma = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" "video" "docker" ]; # Enable ‘sudo’ for the user.
   };


   nixpkgs = {
     config.allowUnfree = true;
   };

   home-manager.users.mpostma = {
	nixpkgs.overlays = [ (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    })) ];
   	programs.neovim = {
		enable = true;
		withPython3 = true;
	};
   };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    binutils-unwrapped
    brave
    clang
    conky
    coreutils
    discord
    fd
    feh
    findutils
    fuse
    fzf
    gawk
    gcc
    gdb
    git
    github-cli
    gnugrep
    gnumake
    gnused
    gnutar
    gzip
    ht-rust
    htop
    killall
    kitty
    lld
    lsd
    ntfs3g
    oh-my-zsh
    openssl.dev
    patchelf
    pavucontrol
    pciutils
    picom
    pkgconfig
    python39
    python39Packages.pynvim
    qemu_full
    ripgrep
    rofi
    rr
    rust-analyzer
    rustup
    scrot
    tmux
    tree-sitter
    vagrant
    vim
    wget
    xclip
    xsel
    zathura
    zsh
    slack
    spotify
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.03"; # Did you read the comment?
}

