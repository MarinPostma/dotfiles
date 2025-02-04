{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager?rev=05c64fa76b2dfbf4a3f5fbca916bcc7f434739d7";
      
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
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

    darwinConfigurations.mbp = let 
      system = "aarch64-darwin";
    in
      nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/darwin
          home-manager.darwinModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs system; };
              users.adhoc = import ./hosts/darwin/home.nix;
            };
            users.users.adhoc.home = /Users/adhoc;
          }
        ];
      };
  };
}
