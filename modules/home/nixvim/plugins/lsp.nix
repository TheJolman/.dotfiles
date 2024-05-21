{ ... }: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      # asm_lsp.enable = true;
      bashls.enable = true;
      cmake.enable = true;
      clangd.enable = true;
      gleam.enable = true;
      jsonls.enable = true;
      # lua_ls.enable = true;
      ruff.enable = true;
    };
  };
}
