{pkgs, ...}:
{
  home.packages = [
    (pkgs.writeScriptBin "cinit" (builtins.readFile ./cinit.sh))

    (pkgs.writeScriptBin "nstemp" (builtins.readFile ./nstemp.sh))

    (pkgs.writeScriptBin "calc" ''
      #usr/bin/env/bash
      nix-shell -p python312 python312Packages.numpy python312Packages.ipython --run "ipython --quick --InteractiveShellApp.exec_lines=\"import numpy as np\""
    '')
  ];

}
