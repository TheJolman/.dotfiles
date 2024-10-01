{pkgs, ...}:

let
  cinitScript = pkgs.fetchFromGitHub {
    owner = "TheJolman";
    repo = "templates";
    rev = "main";
    sha256 = "sha256-2UCOR1O0J67lasw8/uj6aaqhEiSxnHS1PU+Pd/FIKms";
  };
in
{
  home.packages = [
    (pkgs.writeScriptBin "cinit" ''
    . ${cinitScript}/scripts/cinit.sh
    '')

  ];

}
