{pkgs, ...}: {
  home.packages = with pkgs; [
    lighttpd # for `git instaweb`
  ];

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
      merge.tool = "vimdiff";
    };
    ignores = [
      ".nvim/"
      ".direnv/"
      ".claude/"
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
