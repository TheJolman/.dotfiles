#!/usr/bin/env bash

case "$1" in
on)
  sudo protonvpn c -f
  ;;
off)
  sudo protonvpn d
  ;;
help)
  echo "Usage: vpn [on | off]"
  ;;
*)
  printf "Error: unkown argument: %s" "$1"
  exit 1
  ;;
esac
