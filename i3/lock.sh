#!/bin/bash

PAD="$HOME/repos/dotfiles/resources/pad.png"
DIR=`mktemp -d`

cd "$DIR"

import -silent -window root lock.png;
convert lock.png -scale 25% -blur 0x20 -scale 400% lock.png;
composite -gravity center $PAD lock.png lock.png;

i3lock -i lock.png \
  --textcolor=eee8d5ff \
  --ringcolor=07364295 \
  --keyhlcolor=268bd295 \
  --bshlcolor=dc322f95 \
  --insidecolor=002b3695 \
  --insidevercolor=268bd295 \
  --ringvercolor=268bd295 \
  --insidewrongcolor=dc322f95 \
  --ringwrongcolor=dc322f95 \
  --linecolor=07364295 \
  --separatorcolor=07364295;
