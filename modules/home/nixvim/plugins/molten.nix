{...}: {
  programs.nixvim.plugins = {
    molten = {
      enable = true;
      settings = {
        image_provide = "kitty";
      };
    };
    # imgage.nvim?
  };
}
