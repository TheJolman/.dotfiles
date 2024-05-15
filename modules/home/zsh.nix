{ pkgs, config, ... }:
{
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
      update = "sudo nixos-rebuild switch --flake /home/josh/.dotfiles#default";
      copy = "wl-copy";
      paste = "wl-paste";
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

  };
  
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "catppuccin";
  };

}
