{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [djlint];
    plugins.lint = {
      enable = true;
      lintersByFt = {
        htmldjango = ["djlint"];
      };
    };
  };
}
