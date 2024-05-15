{

  description = "NixOS config flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        catppuccin.nixosModules.catppuccin   # works
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.users.josh = {
            imports = [
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };
  };

}
