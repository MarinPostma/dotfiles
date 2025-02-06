{ pkgs, system, ...}:
if system == "x86_64-linux" then {
  services.tailscale.enable = true;

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
    noisetorch.enable = true;
  };

  home.packages = with pkgs; [
    qemu
    qemu_kvm
    edk2
    brave
    gdb
    steam
    alacritty
    git
    obsidian
    gcc
    clang
    gnumake
    discord
    spotify
    xclip
    xsel
    egl-wayland
    mold
    zathura
    pkg-config
    openssl
    arandr
  ];
} else { }
