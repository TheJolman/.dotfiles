{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.nvim-unity
    ];
    # extraConfigLua = ''
    #   require('nvim-unity').setup({
    #     -- config goes here...
    #   })
    # '';
  };
}
