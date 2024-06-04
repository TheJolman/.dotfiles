{...}: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {border = "curved";};
      open_mapping = "[[<A-t>]]";
      autochdir = true;
    };
  };
}
