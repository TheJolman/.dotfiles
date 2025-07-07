{pkgs, ...}: {
  home.packages = [
    (pkgs.writeScriptBin "cinit" (builtins.readFile ./cinit.sh))

    (pkgs.writeScriptBin "nixify" (builtins.readFile ./nixify.sh))

    (pkgs.writeScriptBin "flakify" (builtins.readFile ./flakify.sh))

    (pkgs.writeScriptBin "n" (builtins.readFile ./n.sh))

    (pkgs.writeScriptBin "run" (builtins.readFile ./run.sh))
  ];
}
