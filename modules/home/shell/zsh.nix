{
  config,
  lib,
  ...
}: {
  imports = [
    # agenix.homeManagerModules.default
  ];

  # age.secrets = {
  # anthropic-api-key.file = ../../../secrets/anthropic-api-key.age;
  # groq-api-key.file = ../../../secrets/groq-api-key.age;
  # openai-api-key.file = ../../../secrets/openai-api-key.age;
  # };

  programs.zsh = {
    enable = true;
    dotDir = config.xdg.configHome + "/zsh_hm";
    autocd = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
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
      glo = "git log --oneline --graph -20";
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
      kssh = "kitten ssh";
    };

    sessionVariables = {
      # ANTHROPIC_API_KEY = "$(cat ${config.age.secrets.anthropic-api-key.path})";
      # GROQ_API_KEY = "$(cat ${config.age.secrets.groq-api-key.path})";
      # OPENAI_API_KEY = "$(cat ${config.age.secrets.openai-api-key.path})";
    };

    initContent = ''
      eval "$(pixi completion --shell zsh)"
    '';
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.oh-my-posh = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   useTheme = "catppuccin";
  # };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$docker_context"
        "$golang"
        "$java"
        "$lua"
        "$cmake"
        "$meson"
        "$deno"
        "$nodejs"
        "$ocaml"
        "$gleam"
        "$c"
        "$dotnet"
        "$nix_shell"
        "$line_break"
        "$character"
      ];
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
