{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, ... }@inputs: {
    nixosConfigurations.desktop = let 
      system = "x86_64-linux";
    in nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      modules = [ ./hosts/desktop ];
    };

    nixosConfigurations.xps = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/xps ];
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
              users.adhoc = { ... }: {
                imports = [ ./modules ];
                home.username = "adhoc";
                home.stateVersion = "24.11"; # Please read the comment before changing.
              };
            };
            users.users.adhoc.home = /Users/adhoc;
          }
        ];
      };
  };
}
