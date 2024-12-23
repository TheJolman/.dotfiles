{pkgs, ...}: {
  programs.nixvim = {
    plugins.vimtex = {enable = true;};
    extraPackages = with pkgs; [biber];
  };
}
