{...}: {
  programs.nixvim.plugins.lsp-lines = {
    enable = true;

    luaConfig.pre = ''
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
        only_current_line = true,
      })

    '';
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
