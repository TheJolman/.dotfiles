{ ... }: {
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
    # plugins = {
    #   lualine.enable = true;
    # };
    clipboard.register = "unnamedplus";
  };

}
