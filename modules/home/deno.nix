{...}: {
  home.file = {
    ".deno/deno.json".text = ''
      {
        "nodeModulesDir": "auto"
      }
    '';
  };
}
