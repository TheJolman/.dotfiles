#!/usr/bin/env bash

n_shell() {
  nix shell "$@"
}

n_run() {
  nix run "$@"
}

n_edit() {
  nix edit "$@"
}

n() {
  if (($# < 1)); then
    echo "Error: expected an argument"
    exit 1
  fi

  packages=("${@:2}")

  for i in "${!packages[@]}"; do
    packages[i]="nixpkgs#${packages[i]}"
  done

  echo "${packages[@]}"

  case $1 in
  s)
    n_shell "${packages[@]}"
    ;;
  r)
    if ((${#packages[@]} > 1)); then
      echo "Error: nix run expects only one package"
      exit 1
    fi
    n_run "${packages[@]}"
    ;;
  e)
    n_edit "${packages[@]}"
    ;;
  *)
    printf "Error: unkown argument: %s" "$1"
    exit 1
    ;;
  esac
}

n "$@"
