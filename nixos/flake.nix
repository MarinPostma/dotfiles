{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        xmonad-contexts = {
            url = "github:Procrat/xmonad-contexts";
            flake = false;
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.default = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs; };
            modules = [
                ./hosts/default/configuration.nix
                inputs.home-manager.nixosModules.default
            ];
        };
    };
}
