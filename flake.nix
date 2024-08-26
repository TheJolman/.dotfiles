{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    catppuccin.url = "github:catppuccin/nix";
    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gBar = {
      url = "github:scorpion-26/gBar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/${hostname}/configuration.nix
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager
        ];
        pkgs = import nixpkgs {
         inherit system;
          overlays = [
            inputs.hyprpanel.overlay
          ];
        };
      };
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    nixosConfigurations = {
      framework = mkHost "framework";
      workstation = mkHost "workstation";
    };
  };
}
