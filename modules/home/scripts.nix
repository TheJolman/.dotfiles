{pkgs, ...}:

let
  cinitScript = pkgs.fetchFromGitHub {
    owner = "TheJolman";
    repo = "templates";
    rev = "main";
    sha256 = "sha256-1XcGSZP1h3TlleYpccHezkjlD79pZNJ2z341blGRtZY";
  };
in
{
  home.packages = [
    (pkgs.writeScriptBin "cinit" ''
    . ${cinitScript}/scripts/cinit.sh
    '')

  ];

}
