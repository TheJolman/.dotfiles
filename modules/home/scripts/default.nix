{pkgs, ...}: let
  scriptNames = [
    "cinit"
    "nixify"
    "flakify"
    "n"
    "run"
    "packages"
  ];

  addScript = script: (pkgs.writeScriptBin "${script}"
    (builtins.readFile ./${script}.sh));
in {
  home.packages = builtins.map addScript scriptNames;
}
