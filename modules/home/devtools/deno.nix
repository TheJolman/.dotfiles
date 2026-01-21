{pkgs, ...}: {
  home.packages = with pkgs; [
    deno
  ];
  home.sesstionPath = [
    "$HOME/.deno/bin"
  ];
}
