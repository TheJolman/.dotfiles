{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [djlint];
    plugins.lint = {
      enable = true;
      lintersByFt = {
        # markdown = ["vale"];
        # text = ["vale"];
        # cpp = ["clang-tidy"];
        htmldjango = ["djlint"];
      };
    };
  };
}
