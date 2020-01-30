#!/bin/bash

UNAME_DARWIN="Darwin"

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
UNAME=$(uname)

RUBY=$(command -v ruby)
STOW=$(command -v stow)

if [[ $? -ne 0 ]]; then
  echo "Missing stow"
  exit 1
fi

echo ":: Running common setup..."

$STOW -t $HOME bash
$STOW -t $HOME tmux
$STOW -t $HOME vim
$STOW -t $HOME weechat

if [[ $UNAME -eq $UNAME_DARWIN ]]; then
  echo "==> Running Darwin specific setup..."

  BREW=$(command -v brew)

  if [[ ! -f $BREW ]]; then
    $RUBY -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
elif [[ $UNAME -eq $UNAME_LINUX ]]; then
  echo "==> Running Linux specific setup..."

  $STOW -t $HOME i3
  $STOW -t $HOME dunst
  $STOW -t $HOME gtk
  $STOW -t $HOME misc
  $STOW -t $HOME polybar
  $STOW -t $HOME termite
  $STOW -t $HOME gpgagent
fi

mkdir -p "$HOME/.vim/bundle"

if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo ":: Setting up Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ":: Setting up config symlinks..."
echo ":: Performing post setup..."

vim +PluginInstall +qall

echo ":: Done"
