{...}: {
  programs.nixvim = {
    plugins.copilot-vim = {
      enable = true;
      settings = {
        filetypes = {
          "*" = false;
          python = true;
          c = true;
          cpp = true;
          javascript = true;
          typescript = true;
          jsx = true;
          tsx = true;
          svelte = true;
          go = true;
          html = true;
          css = true;
          java = true;
          cs = true;
        };
      };
    };
    extraConfigLuaPost = ''
      vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('n', '<A-C>', function()
        if vim.g.copilot_enabled == 0 then
          vim.cmd('Copilot enable')
          print('Copilot enabled')
        else
          vim.cmd('Copilot disable')
          print('Copilot disabled')
        end
      end)
      vim.g.copilot_no_tab_map = true
    '';
  };
}
