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
      luaConfig.content = builtins.readFile ./lua/luasnip.lua;
    };
    extraPackages = [pkgs.lua51Packages.jsregexp];
  };
}
