{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = true;
  configDir = ./ags;
}
