{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix = {
    #   url = "github:ryantm/agenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.darwin.follows = "";
    # };

    terminder = {
      url = "github:thejolman/terminder";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tetrigo = {
      url = "github:Broderick-Westrope/tetrigo";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    determinate,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    # allows stable packages to be reached with pkgs.stable.<pkg>
    stableOverlay = final: prev: {
      stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        stableOverlay
      ];
    };

    mkHost = user: hostname:
      lib.nixosSystem {
        inherit system;
        # makes available in rest of config
        specialArgs = {inherit inputs user;};
        modules = [
          determinate.nixosModules.default
          ./hosts/${hostname}/configuration.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs user hostname system;};
              users = {${user} = import ./hosts/${hostname}/home.nix;};
            };

            networking.hostName = hostname;
            nixpkgs.pkgs = pkgs;
          }
        ];
      };

    # nix run home-manager -- switch --flake .#josh@framework
    mkHome = user: hostname:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs user hostname system;};
        modules = [./hosts/${hostname}/home.nix];
      };
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    nixosConfigurations = {
      framework = mkHost "josh" "framework";
      workstation = mkHost "josh" "workstation";
    };

    homeConfigurations = {
      "josh@framework" = mkHome "josh" "framework";
      "josh@workstation" = mkHome "josh" "workstation";
    };
  };
}
