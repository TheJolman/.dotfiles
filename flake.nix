{
  description = "NixOS config flake";

  inputs = 
  let
    mkInput = url: {
      inherit url;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  in
  {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Use the helper function for inputs that follow nixpkgs
    sops-nix = mkInput "github:Mic92/sops-nix";
    home-manager = mkInput "github:nix-community/home-manager";
    hyprland = mkInput "git+https://github.com/hyprwm/Hyprland?submodules=1";
    catppuccin = mkInput "github:catppuccin/nix";
    hyprcursor-phinger = mkInput "github:jappie3/hyprcursor-phinger";
    nixvim = mkInput "github:nix-community/nixvim";
    gBar = mkInput "github:scorpion-26/gBar";
    ags = mkInput "github:Aylur/ags";
    nix-matlab = mkInput "gitlab:doronbehar/nix-matlab";
    hyprpanel = mkInput "github:Jas-SinghFSU/HyprPanel";
    zen-browser = mkInput "github:MarceColl/zen-browser-flake";

    # sops-nix = {
    #   url = "github:Mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # hyprland = {
    #   url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # catppuccin = {
    #   url = "github:catppuccin/nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # hyprcursor-phinger = {
    #   url = "github:jappie3/hyprcursor-phinger";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # gBar = {
    #   url = "github:scorpion-26/gBar";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # ags = {
    #   url = "github:Aylur/ags";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # nix-matlab = {
    #   url = "gitlab:doronbehar/nix-matlab";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # hyprpanel = {
    #   url = "github:Jas-SinghFSU/HyprPanel";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # zen-browser.url = "github:MarceColl/zen-browser-flake";

  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    home-manager,
    hyprpanel,
    nix-matlab,
    hyprcursor-phinger,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.hyprpanel.overlay
        inputs.nix-matlab.overlay
      ];
    };


    mkHost = hostname:
      lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs pkgs;};
        modules = [
          ./hosts/${hostname}/configuration.nix
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;

          }
        ];
      };
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    nixosConfigurations = {
      framework = mkHost "framework";
      workstation = mkHost "workstation";
    };
  };
}
