{pkgs, ...}: {

home.packages = [ (pkgs.writeScriptBin "cinit" ''
#!/usr/bin/env bash

cinit () {
  if [ $# -ne 2 ]; then
    echo "Error: cinit requires 2 arguments."
    echo "Usage: cinit <project_name> <cpp|c>"
    return 1
  fi

  project_name=$1
  c_or_cpp=$2
  src_dir="src"
  include_dir="include"
  

  if [[ ! $c_or_cpp =~ ^(c|cpp)$ ]]; then
    echo "Invalid option: $c_or_cpp. Expecting <c|cpp>."
  fi

  mkdir "$project_name"
  cd "$project_name" || return 1
  mkdir "$src_dir" "$include_dir"

  if [[ "$c_or_cpp" == "c" ]]; then
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/c/.gitignore 
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/c/Makefile
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/c/shell.nix
    wget -P src https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/c/main.c
  else
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/cpp/.gitignore 
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/cpp/Makefile
    wget https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/cpp/shell.nix
    wget -P src https://raw.githubusercontent.com/TheJolman/templates/refs/heads/main/cpp/main.cpp
  fi

  nix-shell

  bear -- make

  if [ ! -d ".git" ]; then
    echo "Git repo already exists."
  else
    echo "Creating a Git repo..."
    git init
    git branch -m main
  fi
}
'') ];

}
