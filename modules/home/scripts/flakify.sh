#!/usr/bin/env bash

flakify() {
    if [ ! -e ./flake.nix ]; then
        nix flake new -t github:nix-community/nix-direnv .
    fi
    if [ ! -e ./.envrc ]; then
        echo "use flake" >.envrc
        direnv allow
    fi
    ${EDITOR:-vim} flake.nix
}

flakify
