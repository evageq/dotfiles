#!/bin/bash -i

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <git-repo-url> <directory-for-bare-repo>"
    exit 1
fi

GIT_REPO_URL="$1"
BARE_REPO_DIR="$2"

echo "alias config='/usr/bin/git --git-dir=$BARE_REPO_DIR --work-tree=$HOME'" >> $HOME/.bashrc

echo "$2" >> $HOME/.gitignore

git clone --bare $GIT_REPO_URL $BARE_REPO_DIR

alias config='/usr/bin/git --git-dir=$BARE_REPO_DIR --work-tree=$HOME'

config checkout

# Handling files that would be overwritten by checkout
if [ $? != 0 ]; then
    echo "Backing up pre-existing dot files."
    mkdir -p .config-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    config checkout
fi

config config --local status.showUntrackedFiles no

echo "Dotfiles repository set up completed."
