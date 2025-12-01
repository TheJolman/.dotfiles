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
      merge.tool = "nvimdiff";
      # git config --global mergetool.nvimdiff.cmd 'nvim -d "$LOCAL" "$REMOTE" "$MERGED" -c "wincmd w" -c "wincmd J"'
      mergetool.nvimdiff.cmd = "nvim -d \"$LOCAL\" \"$REMOTE\" \"$MERGED\" -c \"wincmd w\" -c \"wincmd J\"";
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
