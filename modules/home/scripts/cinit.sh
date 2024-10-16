#!/usr/bin/env bash

download_file() {
    local url="$1"
    local destination="$2"
    curl -sSL --connect-timeout 10 --retry 3 --retry-delay 5 -o "$destination" "$url" || {
        echo "Error: Failed to download $url"
        return 1
    }
}

cinit () {
  if [ $# -ne 2 ]; then
    echo "Error: cinit requires 2 arguments."
    echo "Usage: cinit <project_name> <cpp|c>"
    return 1
  fi

  project_name="$1"
  c_or_cpp="$2"
  src_dir="src"
  include_dir="include"
  base_url="https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main"

  if [[ ! $c_or_cpp =~ ^(c|cpp)$ ]]; then
    echo "Invalid option: $c_or_cpp. Expecting <c|cpp>."
    return 1
  fi

  mkdir "$project_name"
  cd "$project_name" || return 1
  mkdir "$src_dir" "$include_dir"

  files=(".gitignore" "Makefile" "shell.nix")
  for file in "${files[@]}"; do
    if ! download_file "$base_url/$c_or_cpp/$file" "$file"; then
      echo "Failed to set up project. Exiting."
      return 1
    fi
  done

  if ! download_file "$base_url/$c_or_cpp/main.$c_or_cpp" "$src_dir/main.$c_or_cpp"; then
    echo "Failed to set up project. Exiting."
    return 1
  fi

  if [ -d ".git" ]; then
    echo "Git repo already exists."
  else
    echo "Creating a Git repo..."
    git init -b main
  fi

  echo "Running nix-shell to execute 'bear -- make'..."
  nix-shell --run 'bear -- make'

  echo "Project setup complete."
}

cinit "$@"
