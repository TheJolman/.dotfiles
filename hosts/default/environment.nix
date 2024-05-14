{ config, pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # environment.variables.EDITOR = "nvim";

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;


  #programs.zsh = {
  #  enable = true;
  #  enableCompletion = true;
  #  syntaxHighlighting.enable = true;

  #  shellAliases = {
  #    ll = "lsd -l";
  #    ls = "lsd";
  #    tree = "lsd --tree";
  #    update = "sudo nixos-rebuild switch --flake /home/josh/.dotfiles#default";
  #    copy = "wl-copy";
  #    paste = "wl-paste";
  #  };

  #  ohMyZsh = {
  #    enable = true;
  #    plugins = [ "git" ];
  #    theme = "refined";
  #  };
  #};
}
