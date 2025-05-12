{...}: {
  programs.nixvim.plugins.lsp-lines = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      key = "gl";
      action = "lua require('lsp_lines').toggle()";
      mode = "n";
      options.desc = "Toggle lsp_lines";
    }
  ];
}
