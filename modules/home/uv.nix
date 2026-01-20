{pkgs, ...}: {
  home.packages = with pkgs; [
    uv
  ];

  home.sessionPath = [
    "$HOME/.local/share/../bin"
  ];
}
