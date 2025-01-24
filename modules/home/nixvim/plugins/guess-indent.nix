{...}: {
  programs.nixvim.plugins.guess-indent = {
    enable = true;
    autoLoad = true;
    settings = {
      auto_cmd = true;
    };
  };
}
