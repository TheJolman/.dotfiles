{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Josh Holman";
      user.email = "git@jolman.me";
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
      ".claude/"
    ];
  };

  # programs.delta.enable = true;

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
}
