{ ... }:

{
  imports = [
    ./../../modules
  ];
  home.username = "adhoc";
  home.homeDirectory = "/home/adhoc";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
