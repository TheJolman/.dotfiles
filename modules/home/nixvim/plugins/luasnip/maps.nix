{config, ...}: let
  helpers = config.lib.nixvim;
in {
  programs.nixvim.keymaps = [
    {
      key = "<C-K>";
      action = "lua require('luasnip').expand()";
      mode = "i";
    }
    {
      key = "<C-L>";
      action = "lua require('luasnip').jump(1)";
      mode = ["i" "s"];
    }
    {
      key = "<C-J>";
      action = "lua require('luasnip').jump(-1)";
      mode = ["i" "s"];
    }
    {
      key = "<C-E>";
      action = helpers.mkRaw ''
        function() require('luasnip').expand()
          if require('luasnip').choice_active() then
            require('luasnip').change_choice(1)
          end
        end
      '';
      mode = ["i" "s"];
    }
  ];
}
