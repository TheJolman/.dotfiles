#!/usr/bin/env zsh

download_file() {
    local url="$1"
    local destination="$2"
    curl -sSL --connect-timeout 10 --retry 3 --retry-delay 5 -o "$destination" "$url" || {
        echo "Error: Failed to download $url"
        return 1
    }
}

nsinit() {
    template_url="https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/any/shell.nix"

    if ! download_file "$template_url" "shell.nix"; then
        echo "Failed to set up project. Exiting."
        return 1
    fi

    echo "generic shell.nix generated."
    echo "use nix" >> .envrc
    direnv allow
    echo "direnv set up."
}

nsinit
