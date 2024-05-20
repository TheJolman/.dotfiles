{ ... }: {
  imports = [
    ./plugins/default.nix
    ./maps.nix
  ];
  programs.nixvim = {
    enable = true;

  
    # colorschemes.catppuccin = {
    #   enable = true;
    #   settings.flavour = "mocha";
    # };
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    clipboard.register = "unnamedplus";
  };

}
