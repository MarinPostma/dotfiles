# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./../../modules/wm/xmonad/default.nix
            inputs.home-manager.nixosModules.default
        ];

    nix.settings.experimental-features = [ "nix-command"  "flakes" ];
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
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
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd startx";
                user = "greeter";
            };
        };
    };

    programs.xmonad.enable = true;

    security.polkit.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "adhocnixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Prague";

    # Select internationalisation properties.
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

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;
    services.xserver.videoDrivers = ["nvidia"];

    # Enable the KDE Plasma Desktop Environment.
    # services.displayManager.sddm.enable = true;
    # services.desktopManager.plasma6.enable = true;

    # services.xserver.displayManager.gdm.enable = true;
    # services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

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

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.adhoc = {
        isNormalUser = true;
        description = "adhoc";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
            #  thunderbird
        ];
    };

    # Install firefox.
    programs.firefox.enable = true;
    programs.zsh.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim
        wget
        alacritty
        mangohud # perf monitor overlay
        protonup
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
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        # add dylibs here
    ];

    programs._1password.enable = true;
    programs._1password-gui = {
        enable = true;
    };

    ## Gamming
    programs.steam.enable = true;
    # launch game in micro-compositor for better compat
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true; # perf enhancement
    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/adhoc/.steam/root/compatibilitytools.d";
    };

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
    system.stateVersion = "24.11"; # Did you read the comment?

}
