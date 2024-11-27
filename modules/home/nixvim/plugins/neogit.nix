{...}: {
  programs.nixvim.plugins.neogit = {
    enable = true;
    settings = {
      integrations = {
        fzf_lua = true;
        diffview= true;
      };
    };
  };
}
