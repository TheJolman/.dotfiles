{...}: {
  programs.git = {
    enable = true;
    userEmail = "joshuaholman5@gmail.com";
    userName = "josh";
  };

  programs.lazygit = {
    enable = true;
  };

  programs.git-credential-oauth.enable = true;
}
