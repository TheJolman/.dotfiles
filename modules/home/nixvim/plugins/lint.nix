{...}: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      markdown = ["vale"];
      cpp = ["clang-tidy"];
      htmldjango = ["djlint"];
    };
  };
}
