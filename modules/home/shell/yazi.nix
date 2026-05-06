{...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
  };

  # programs.zsh.initContent = ''
  #   function y() {
  #     local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  #     yazi "$@" --cwd-file="$tmp"
  #     if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  #       builtin cd -- "$cwd"
  #     fi
  #     rm -f -- "$tmp"
  #   }
  # '';
}
