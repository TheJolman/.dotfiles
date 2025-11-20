#!/usr/bin/env bash

set -euo pipefail

if (($# < 1)); then
  echo "Error: expected an argument of [on|off]"
  exit 1
fi

case $1 in
on)
  hyprctl keyword input:accel_profile adaptive
  echo "Mouse acceleration enabled"
  ;;

off)
  hyprctl keyword input:accel_profile flat
  echo "Mouse acceleration disabled"
  ;;

*)
  echo "Error: expected an argument of [on|off]"
  exit 1
  ;;
esac
