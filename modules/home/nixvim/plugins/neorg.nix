{...}: {
  programs.nixvim = {
    plugins.neorg = {enable = true;};
    extraConfigLuaPost = ''
      -- lua config (extraConfigLua doesn't work in the neorg module)
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "varied",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              index = "index.norg",
            },
          },
        },
      })

    '';
  };
}
