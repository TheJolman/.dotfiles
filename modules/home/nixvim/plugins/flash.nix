{ ... }: {
  programs.nixvim.plugins.flash = {
    enable = true;
    jump = {
      autojump = true;  # try this as true at some point
      nohlsearch = true;  # this clears the hightlight after jump
    };
    label = {
      rainbow.enabled = false;
    };
  };
  programs.nixvim.extraConfigLua = ''
    vim.keymap.set({"n", "x", "o"}, "<leader>s", function() require("flash").jump() end, {desc = "Flash"})
    vim.keymap.set({"n", "x", "o"}, "<leader>S", function() require("flash").treesitter() end, {desc = "Flash Treesitter"})
    vim.keymap.set("o", "r", function() require("flash").remote() end, {desc = "Remote Flash"})
    vim.keymap.set({"o", "x"}, "R", function() require("flash").treesitter_search() end, {desc = "Treesitter Search"})
    vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, {desc = "Toggle Flash Search"})

  '';
}
