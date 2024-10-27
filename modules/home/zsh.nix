{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "lsd -l";
      ls = "lsd";
      tree = "lsd --tree";
      copy = "wl-copy";
      paste = "wl-paste";
      lg = "lazygit";
      nb = "nom build";
      # nd = "nix develop -c zsh";
      nd = "nom develop -c zsh";
      ns = "nom build";
      ya = "yazi";
      vpnon = "sudo protonvpn c -f";
      vpnoff = "sudo protonvpn d";
      matlab = "matlab -nodesktop -nosplash";
      switch = "nh os switch";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    initExtra = ''
      update() {
        local host=''${1:-$(hostname)}
        sudo nixos-rebuild switch --flake ~/.dotfiles#$host
      }
    '';

    # use initExtra = '' ''; for extra config
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "catppuccin";
  };
}
