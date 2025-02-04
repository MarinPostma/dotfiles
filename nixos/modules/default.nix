{ pkgs, lib, ... }: {
  imports = [
    ./programs/zsh
    ./programs/nvim
    ./programs/qute
    ./programs/tmux
    ./programs/git
    ./programs/rust
    ./programs/alacritty
  ];
}
