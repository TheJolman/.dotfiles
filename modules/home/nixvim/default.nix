{ ... }: {
  imports = [
    ./plugins/default.nix
    ./maps.nix
  ];
  programs.nixvim = {
    enable = true;

  
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
      settings = {
      transparent_background = true;
	integrations = {
	  cmp = true;
	  gitsigns = true;
	  treesitter = true;
	};
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    clipboard.register = "unnamedplus";
  };

}
