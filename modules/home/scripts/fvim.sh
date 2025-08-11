#!/usr/bin/env bash

result=$(fd "$1")
if [ "$result" ]; then
  "$EDITOR" "$result" "${@:2}"
else
  echo "No files found matching: " "$1" >&2
  exit 1
fi
