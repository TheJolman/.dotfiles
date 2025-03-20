{pkgs, ...}: {
  home.packages = [
    (pkgs.writeScriptBin "cinit" (builtins.readFile ./cinit.sh))

    (pkgs.writeScriptBin "nsinit" (builtins.readFile ./nsinit.sh))

    (pkgs.writeScriptBin "nfinit" (builtins.readFile ./nfinit.sh))

    (pkgs.writeScriptBin "calc" ''
      #usr/bin/env/bash
      nix-shell -p python312 python312Packages.numpy python312Packages.ipython --run "ipython --quick --InteractiveShellApp.exec_lines=\"import numpy as np\""
    '')

    (pkgs.writeScriptBin "n" (builtins.readFile ./n.sh))

    (pkgs.writeScriptBin "run" (builtins.readFile ./run.sh))
  ];
}
