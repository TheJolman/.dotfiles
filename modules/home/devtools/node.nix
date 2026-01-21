{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    pnpm
    yarn
  ];
  home.sessionPath = [
    "$HOME/.pnpm"
  ];
}
