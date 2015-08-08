#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function create_or_fail() {
    SOURCE=$0
    DEST=$1

    # Check if a file exists at $DEST and is not a link.
    if [[ -f $DEST && ! -L $DEST ]]; then
        echo -e "\nERROR: $DEST already exists and is not a link.";
        exit 1;
    else
        ln -fs $SOURCE $DEST
    fi
}

echo -n "Setting up config symlinks... "

create_or_fail "$DIR/bashrc" "$HOME/.bashrc"
create_or_fail "$DIR/tmux.conf" "$HOME/.tmux.conf"
create_or_fail "$DIR/vimrc" "$HOME/.vimrc"

echo "done"
