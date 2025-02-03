{...}: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      terminal.enable = true;
      lazygit.enable = true;
      quickfile.enable = true;
      bigfile.enable = true;
    };
  };
}
