{pkgs, ...}: {
  home.packages = with pkgs; [
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
      ]))
  ];
}
