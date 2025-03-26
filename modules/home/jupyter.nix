{pkgs, ...}: {
  home.packages = with pkgs; [
    texliveFull
    (python3.withPackages (p:
      with p; [
        jupyterlab
        jupyterlab-widgets
        jupyterlab-lsp
        jupyterlab-git
        jupyterlab-execute-time
        nbconvert
        python-lsp-server
        jedi
        nbdime
        ipython
        numpy
      ]))
    (writeScriptBin "calc" ''
      #usr/bin/env/bash
      ipython --quick --InteractiveShellApp.exec_lines="import numpy as np"
    '')
  ];
}
