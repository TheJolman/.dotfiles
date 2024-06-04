{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;

    ensureInstalled = [
      "bash"
      "nix"
      "c"
      "cpp"
      "python"
      "lua"
      "html"
      "nasm"
      "gleam"
      "latex"
      "make"
      "json"
    ];
  };

  programs.nixvim.extraPackages = [pkgs.clang];
}
