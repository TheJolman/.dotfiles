{...}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";

    settings = {
      transparent_background = false;
      show_end_of_buffer = true;
      dim_inactive.enabled = true;

      integrations = {
        cmp = true;
        gitsigns = true;
        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };
        flash = true;
        rainbow_delimiters = true;
        diffview = true;
        native_lsp = {
          enabled = true;
          virtual_text = {
            errors = ["italic"];
            hints = ["italic"];
            warnings = ["underline"];
            information = ["underline"];
          };
          inlay_hints = {background = true;};
        };
        snacks = {
          enabled = true;
        };
        mini.enabled = true;
      };
    };
  };
}
