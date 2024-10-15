{...}: {
  programs.nixvim.plugins = {
    render-markdown = {
      enable = true;
    };
    markdown-preview = {
      enable = true;
    };
  };
}
