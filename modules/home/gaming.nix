{ pkgs, lib, config, ... }: {
    
  options = {
    gaming.enable =
      lib.mkEnableOption "enables Steam and other gaming stuff";

  };

  config = lib.mkIf config.gaming.enable {
    home.pkgs = [pkgs.steam];
  };
}
