{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins/default.nix
    ./maps.nix
    ./opts.nix
    ./colorscheme.nix
  ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    nixpkgs.config.allowUnfree = true;

    extraConfigLua = builtins.readFile ./lua-config.lua;
  };
}
