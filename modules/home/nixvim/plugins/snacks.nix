{...}: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      terminal.enable = true;
      lazygit.enable = true;
      quickfile.enable = true;
      bigfile.enable = true;
      picker.enable = true;
      image.enable = true;
      rename.enable = true;
      bufdelete.enable = true;
      words.enable = true;
      gitbrowse.enable = true;
      git.enable = true;
      scroll = {
        enable = true;
        animate_repeat = {
          delay = 100;
        };
      };
      animate.enable = true;
    };
    luaConfig.post = ''
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })
    '';
  };
}
