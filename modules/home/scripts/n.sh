#!/usr/bin/env bash

n() {
  if (($# < 1)); then
    echo "Error: expected an argument" >&2
    exit 1
  fi

  packages=("${@:2}")

  for i in "${!packages[@]}"; do
    packages[i]="nixpkgs#${packages[i]}"
  done

  # Use nom if it's available, fall back to nix
  nix_cmd=$(command -v nom >/dev/null 2>&1 && echo nom || echo nix)

  case $1 in
  s) # shell
    echo "Running '$nix_cmd shell ${packages[*]}'..."
    $nix_cmd shell "${packages[@]}"
    ;;
  r) # run
    if ((${#packages[@]} > 1)); then
      echo "Error: nom run expects only one package" >&2
      exit 1
    fi
    echo "Running 'nom run ${packages[*]}'..."
    $nix_cmd run "${packages[@]}"
    ;;

  d) # develop
    echo "Running '$nix_cmd develop ${packages[*]}'..."
    $nix_cmd develop "${packages[@]}"
    ;;
  e) # edit
    echo "Running 'nix edit ${packages[*]}'..."
    nix edit "${packages[@]}"
    ;;
  *)
    printf "Error: unkown argument: %s" "$1" >&2
    exit 1
    ;;
  esac
}

n "$@"

