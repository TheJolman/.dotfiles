{...}: {
  programs.nixvim = {
    plugins = {
      markdown-preview = {
        enable = true;
      };
      markview = {
        enable = true;
        luaConfig.post = ''
          filetypes = {"markdown", "quarto", "rmd"},
        '';
      };
    };
  };
}
