{ pkgs, lib, config, ... }: {
    
  options = {
    gaming.enable =
      lib.mkEnableOption "enables Steam";

  };

  config = lib.mkIf config.gaming.enable {
    home.packages = [pkgs.steam];
  };
}
