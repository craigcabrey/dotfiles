#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function link_or_fail() {
    SOURCE=$1
    DEST=$2

    # Check if a file exists at $DEST and is not a link.
    if [[ ( -d $DEST || -f $DEST ) && ! -L $DEST ]]; then
        echo -e "\nERROR: $DEST already exists and is not a link.";
        exit 1;
    else
        ln -fs $SOURCE $DEST
    fi
}

echo ":: Creating required directory structure... "

mkdir -p "$HOME/.vim/bundle"

if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo ":: Setting up Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ":: Setting up config symlinks... "

link_or_fail "$DIR/bashrc" "$HOME/.bashrc"
link_or_fail "$DIR/tmux.conf" "$HOME/.tmux.conf"
link_or_fail "$DIR/vimrc" "$HOME/.vimrc"
link_or_fail "$DIR/systemd" "$HOME/.config/systemd"
link_or_fail "$DIR/i3" "$HOME/.config/i3"
link_or_fail "$DIR/weechat" "$HOME/.weechat"
link_or_fail "$DIR/Xresources" "$HOME/.Xresources"

echo ":: Performing post setup..."

systemctl --user daemon-reload
vim +PluginInstall +qall

echo ":: Done"
