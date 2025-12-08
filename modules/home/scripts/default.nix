{pkgs, ...}: let
  scriptNames = [
    "cinit"
    "nixify"
    "flakify"
    "n"
    "run"
    "packages"
    "fvim"
    "accel"
  ];

  addScript = script: (pkgs.writeScriptBin "${script}"
    (builtins.readFile ./${script}.sh));
in {
  home.packages = builtins.map addScript scriptNames;
}
