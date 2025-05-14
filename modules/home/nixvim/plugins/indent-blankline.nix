{...}: {
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      # indent.char = "▏";
      indent.char = "┋";
      scope = {
        enabled = true;
        show_end = false;
        show_exact_scope = false;
        show_start = true;
      };
    };
    luaConfig.post = ''
      local highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup { scope = { highlight = highlight } }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    '';
  };
}
