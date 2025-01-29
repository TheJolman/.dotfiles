{...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autocd = true;
    enableCompletion = true;
    defaultKeymap = null;
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
      gP = "git push";
      gp = "git pull";
      gm = "git merge";
      gr = "git rebase";
      gd = "git diff";
      gl = "git log";
      gf = "git fetch";
      gb = "git branch";
      gsw = "git switch";
      gch = "git checkout";
      nb = "nom build";
      nd = "nom develop -c zsh";
      ns = "nom shell";
      vpnon = "sudo protonvpn c -f";
      vpnoff = "sudo protonvpn d";
      matlab = "matlab -nodesktop -nosplash";
      switch = "nh os switch";
      packages = "nvim ~/.dotfiles/modules/home/packages.nix";
      run = "hyprctl dispatch exec";
      ssh = "kitten ssh";
    };

    # zplug is slow as shit for some reason
    # zplug = {
    #   enable = true;
    #   plugins = [
    #     {name = "chisui/zsh-nix-shell";}
    #     # {name = "zsh-users/zsh-completions";}
    #     {name = "mrjohannchang/zsh-interactive-cd";}
    #     # {name = "romkatv/zsh-defer";}
    #   ];
    # };

    # Unused function replaced by `nh os switch`
    # update() {
    #   local host=''${1:-$(hostname)}
    #   sudo nixos-rebuild switch --flake ~/.dotfiles#$host
    # }
    initExtra = ''
      source ~/.dotfiles/.env

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
      alias ngs='git -C ~/notes add . && git -C ~/notes commit -m "$(date "+%Y-%m-%d %H:%M:%S")" && git -C ~/notes pull --rebase && git -C ~/notes push'
    '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.oh-my-posh = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   useTheme = "catppuccin";
  # };
}
