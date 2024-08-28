{inputs, pkgs, ...}: {
  imports = [ inputs.gBar.homeManagerModules.x86_64-linux.default ];

  programs.gBar = {
    enable = true;
    config = {
      Location = "T";
      EnableSNI = true;
      SNIIconSize = {
        Discord = 26;
        Zoom = 26;
      };
      WorkspaceSymbols = [ "1" "2" "3" "4" "5" "6" "7" "8" "9"];

    };
  };
  home.packages = with pkgs; [
    pamixer
    killall

  ];

}
