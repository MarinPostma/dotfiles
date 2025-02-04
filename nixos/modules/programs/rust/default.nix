{ pkgs, inputs, ...}:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  home.packages = [ pkgs.rust-bin.stable.latest.default ];
  home.file.".cargo/config.toml".source = ./cargo-config.toml;
}
