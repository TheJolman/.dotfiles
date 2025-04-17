{...}: {
  programs.git = {
    enable = true;
    userEmail = "joshuaholman5@gmail.com";
    userName = "josh";
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
      user.signingkey = "~/.ssh/id_ed25519";
      commit.gpgsign = true;
    };
    ignores = [
      ".nvim/"
      ".direnv/"
    ];
  };

  programs.lazygit = {
    enable = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
}
