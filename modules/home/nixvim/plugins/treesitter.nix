{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;

    settings.ensure_installed = [
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
      "matlab"
      "javascript"
      "typescript"
      "meson"
    ];
  };

  programs.nixvim.extraPackages = [pkgs.clang];
}
