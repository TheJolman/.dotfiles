#!/bin/bash

# Configuration
GITHUB_REPO="https://github.com/yourusername/dotfiles.git"
GIT_DIR="$HOME/.dotfiles"
TMP_DIR="$HOME/dotfiles-tmp"

# Check for Git
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git first."
    exit 1
fi

# Clone the dotfiles repository
if [ -d "$GIT_DIR" ]; then
    echo "Dotfiles directory already exists"
else
    echo "Cloning dotfiles..."
    git clone --separate-git-dir=$GIT_DIR $GITHUB_REPO $TMP_DIR
fi

# Backup any existing dotfiles in the home directory and move the new ones in
rsync --recursive --verbose --exclude '.git' $TMP_DIR/ $HOME/
rm -rf $TMP_DIR

# Set the alias in the current session
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prevent untracked files from showing up
dotfiles config --local status.showUntrackedFiles no

echo "Dotfiles setup completed."
