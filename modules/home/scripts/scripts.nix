{pkgs, ...}:

let
  ghRepo = pkgs.fetchFromGitHub {
    owner = "TheJolman";
    repo = "templates";
    rev = "f56e1bb353471b89cde13930c570e22e7ca38312";
    sha256 = "sha256-CdvNt9TVPyw9WUyufK6xjWfPhGLD2EQitr+tV6wao78";
  };
in
{
  home.packages = [
    (pkgs.writeScriptBin "cinit" ''
    . ${ghRepo}/scripts/cinit.sh
    '')

    (pkgs.writeScriptBin "nstemp" ''
    . ${ghRepo}/scripts/nstemp.sh
    '')

    (pkgs.writeScriptBin "calc" ''
      #usr/bin/env/bash
      nix-shell -p python312 python312Packages.numpy python312Packages.ipython --run "ipython --quick --InteractiveShellApp.exec_lines=\"import numpy as np\""
    '')
  ];

}
