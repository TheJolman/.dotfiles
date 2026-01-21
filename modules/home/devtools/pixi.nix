{pkgs, ...}: {
  home.packages = with pkgs; [
    pixi
  ];
  programs.zsh.initContent = ''
    eval "$(pixi completion --shell zsh)"
  '';
}
