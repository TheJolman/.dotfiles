{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      friendly-snippets.enable = true;
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
        };
      };
      luaConfig.content = ''
        require("luasnip.loaders.from_vscode").lazy_load()
      '';
    };
    extraPackages = [pkgs.lua51Packages.jsregexp];
  };
}
