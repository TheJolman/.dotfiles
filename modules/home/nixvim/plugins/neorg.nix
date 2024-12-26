{...}: {
  programs.nixvim = {
    plugins.neorg = {enable = true;};
    extraConfigLuaPost = ''
      require("neorg").setup({
          load = {
              ["core.defaults"] = {},
              ["core.concealer"] = {
                  config = {
                      icon_preset = "varied",
                  },
              },
          }
      })

    '';
  };
}
