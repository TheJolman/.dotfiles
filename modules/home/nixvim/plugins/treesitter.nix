{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      highlight = {
        enable = true;
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
    nixvimInjections = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      c
      cpp
      python
      lua
      html
      nasm
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
      markdown-inline
      nix
      regex
      toml
      vim
      vimdoc
      xml
      hyprlang
      yaml
      norg
      diff
      git_config
      git_rebase
      gitignore
      gitcommit
      gitattributes
    ];
  };

  programs.nixvim.extraPackages = [pkgs.clang];
}
