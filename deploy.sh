#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

STOW=$(command -v stow)

if [[ $? -ne 0 ]]; then
  echo "Missing stow"
  exit 1
fi

echo ":: Running stow..."

$STOW -t $HOME i3
$STOW -t $HOME bash
$STOW -t $HOME dunst
$STOW -t $HOME gtk
$STOW -t $HOME misc
$STOW -t $HOME polybar
$STOW -t $HOME termite
$STOW -t $HOME tmux
$STOW -t $HOME vim
$STOW -t $HOME weechat

mkdir -p "$HOME/.vim/bundle"

if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo ":: Setting up Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ":: Setting up config symlinks..."
echo ":: Performing post setup..."

vim +PluginInstall +qall

echo ":: Done"
