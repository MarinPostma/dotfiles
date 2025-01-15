{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    ghostty.url = "github:clo4/ghostty-hm-module";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs; };
      modules = [
        ./hosts/desktop/configuration.nix
      ];
    };

    nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/gaming/configuration.nix
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop/configuration.nix
      ];
    };
  };
}
