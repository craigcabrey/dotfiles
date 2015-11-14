#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function link_or_fail() {
    SOURCE=$1
    DEST=$2

    # Check if a file exists at $DEST and is not a link.
    if [[ -f $DEST && ! -L $DEST ]]; then
        echo -e "\nERROR: $DEST already exists and is not a link.";
        exit 1;
    else
        ln -fs $SOURCE $DEST
    fi
}

echo -n "Creating required directory structure... "

mkdir -p "$HOME/.config/systemd/user"

echo -n "setting up config symlinks... "

link_or_fail "$DIR/bashrc" "$HOME/.bashrc"
link_or_fail "$DIR/tmux.conf" "$HOME/.tmux.conf"
link_or_fail "$DIR/vimrc" "$HOME/.vimrc"
link_or_fail "$DIR/systemd/xflux.service" "$HOME/.config/systemd/user/"
link_or_fail "$DIR/systemd/tmux.service" "$HOME/.config/systemd/user/"

systemctl --user daemon-reload

echo "done"
