{pkgs, ...}: {
  home.packages = [
    (pkgs.writeScriptBin "cinit" (builtins.readFile ./cinit.sh))

    (pkgs.writeScriptBin "nsinit" (builtins.readFile ./nsinit.sh))

    (pkgs.writeScriptBin "nfinit" (builtins.readFile ./nfinit.sh))

    (pkgs.writeScriptBin "n" (builtins.readFile ./n.sh))

    (pkgs.writeScriptBin "run" (builtins.readFile ./run.sh))
  ];
}
