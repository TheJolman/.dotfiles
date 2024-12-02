{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cd = "z";
      ll = "lsd -l";
      ls = "lsd";
      tree = "lsd --tree";
      copy = "wl-copy";
      paste = "wl-paste";
      lg = "lazygit";
      ng = "nvim +Neogit";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gm = "git merge";
      nb = "nom build";
      nd = "nom develop -c zsh";
      ns = "nom shell";
      vpnon = "sudo protonvpn c -f";
      vpnoff = "sudo protonvpn d";
      matlab = "matlab -nodesktop -nosplash";
      switch = "nh os switch";
      packages = "nvim ~/.dotfiles/modules/home/packages.nix";
    };

    zplug = {
      enable = true;
      plugins = [
        {name = "chisui/zsh-nix-shell";}
        {name = "zsh-users/zsh-completions";}
      ];
    };

    initExtra = ''
      update() {
        local host=''${1:-$(hostname)}
        sudo nixos-rebuild switch --flake ~/.dotfiles#$host
      }

      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "catppuccin";
  };
}
