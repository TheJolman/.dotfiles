{
  config,
  agenix,
  ...
}: {
  imports = [
    agenix.homeManagerModules.default
  ];

  age.secrets = {
    anthropic-api-key.file = ../../../secrets/anthropic-api-key.age;
    groq-api-key.file = ../../../secrets/groq-api-key.age;
    openai-api-key.file = ../../../secrets/openai-api-key.age;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh_hm";
    autocd = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
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
      g = "git";
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
      switch = "nh os switch";
      packages = "nvim ~/.dotfiles/modules/home/packages.nix";
      kssh = "kitten ssh";
    };

    sessionVariables = {
      ANTHROPIC_API_KEY = "$(cat ${config.age.secrets.anthropic-api-key.path})";
      GROQ_API_KEY = "$(cat ${config.age.secrets.groq-api-key.path})";
      OPENAI_API_KEY = "$(cat ${config.age.secrets.openai-api-key.path})";
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"
      autoload -Uz compinit && compinit
      eval "$(pixi completion --shell zsh)"

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
