{pkgs, ...}:

let
  ghRepo = pkgs.fetchFromGitHub {
    owner = "TheJolman";
    repo = "templates";
    rev = "19c6002464f2f6c9977dda0c60d237e08885b1b6";
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
