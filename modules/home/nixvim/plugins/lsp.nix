{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
      # asm-lsp.enable = true;
      bashls.enable = true;
      cmake.enable = true;
      clangd.enable = true;
      gleam.enable = true;
      jsonls.enable = true;
      lua-ls.enable = true;
      ruff.enable = true;
    };
  };
}
