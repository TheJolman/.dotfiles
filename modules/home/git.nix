{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "joshuaholman5@gmail.com";
    userName = "josh";
  };

  programs.lazygit = {
    enable = true;
    catppuccin.enable = true;
  };
}
