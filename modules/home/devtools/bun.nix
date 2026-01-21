{...}: {
  programs.bun = {
    enable = true;
    settings = {
      telemetry = false;
    };
  };
  home.sessionPath = [
    "$HOME/.cache/.bun/bin"
  ];
}
