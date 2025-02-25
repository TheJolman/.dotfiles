{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = false;
      parser_isntall_dir = null;
      highlight = {
        enable = true;
        disable = [
          # broken for some reason
          "c"
          "cpp"
        ];
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
    nixGrammars = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # c
      # cpp
      python
      lua
      html
      nasm
      asm
      latex
      julia
      kotlin
      java
      groovy
      c_sharp
      htmldjango
      javascript
      typescript
      tsx
      gleam
      svelte
      gdscript
      php
      r
      zig
      rust
      meson
      ninja
      go
      gomod
      gosum
      bash
      json
      make
      cmake
      matlab
      markdown
      markdown-inline
      nix
      regex
      sql
      toml
      sql
      vim
      vimdoc
      csv
      desktop
      xml
      hyprlang
      yaml
      powershell
      norg
      terraform
      http
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
