{ pkgs, ... }:
{
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
    open = false;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  programs.firefox.enable = true;

  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
}
