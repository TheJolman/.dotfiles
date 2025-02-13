{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh_hm";
    autocd = true;
    enableCompletion = true;
    defaultKeymap = null;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cd = "z";
      ll = "lsd -l";
      ls = "lsd";
      ya = "yazi";
      tree = "lsd --tree";
      copy = "wl-copy";
      paste = "wl-paste";
      lg = "lazygit";
      ga = "git add";
      gc = "git commit";
      gP = "git push";
      gp = "git pull";
      gm = "git merge";
      gr = "git rebase";
      gd = "git diff";
      gl = "git log";
      glo = "git log --oneline";
      gf = "git fetch";
      gb = "git branch";
      gs = "git switch";
      gst = "git stash";
      gch = "git checkout";
      nb = "nom build";
      nd = "nom develop";
      ns = "nom shell";
      nr = "nix run";
      vpnon = "sudo protonvpn c -f";
      vpnoff = "sudo protonvpn d";
      matlab = "matlab -nodesktop -nosplash";
      switch = "nh os switch";
      packages = "nvim ~/.dotfiles/modules/home/packages.nix";
      run = "hyprctl dispatch exec";
      ssh = "kitten ssh";
    };

    # Unused function replaced by `nh os switch`
    # update() {
    #   local host=''${1:-$(hostname)}
    #   sudo nixos-rebuild switch --flake ~/.dotfiles#$host
    # }

    initExtra = ''
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

  # programs.starship = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "catppuccin";
  };
}
