{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      hightlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      indent.enable = true;

      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = false;
          node_decremental = "gtm";
          node_incremental = "gtn";
          scope_incremental = "gtc";
        };
      };
    };
    folding = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      c
      cpp
      python
      lua
      html
      nasm
      gleam
      latex
      julia
      kotlin
      java
      c_sharp
      htmldjango
      javascript
      typescript
      gleam
      svelte
      gitignore
      gdscript
      php
      r
      zig
      rust
      meson
      go
      bash
      json
      lua
      make
      cmake
      matlab
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      hyprlang
      yaml
    ];
  };

  programs.nixvim.extraPackages = [pkgs.clang];
}
