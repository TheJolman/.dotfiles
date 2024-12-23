{pkgs, ...}: {
  programs.nixvim = {
    plugins.fzf-lua = {enable = true;};
    extraPackages = with pkgs; [viu chafa ueberzugpp];
  };
}
