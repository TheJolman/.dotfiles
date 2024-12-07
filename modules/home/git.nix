{...}: {
  programs.git = {
    enable = true;
    userEmail = "joshuaholman5@gmail.com";
    userName = "josh";
    delta.enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.git-credential-oauth.enable = true;
}
