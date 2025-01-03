{...}: {
  programs.nixvim = {
    plugins.lsp-lines = {
      enable = true;
    };
    extraConfigLuaPost = ''
      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
        virtual_text = false,
      })
    '';
  };
}
