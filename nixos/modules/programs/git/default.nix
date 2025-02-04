{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    userName = "adhoc";
    userEmail = "postma.marin@protonmail.com";
  };
}
