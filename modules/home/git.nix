{...}: {
  programs.git = {
    enable = true;
    userEmail = "git@jolman.me";
    userName = "Josh Holman";
    delta.enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      commit.gpgsign = true;
    };
    ignores = [
      ".nvim/"
      ".direnv/"
    ];
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
}
