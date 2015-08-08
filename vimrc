" first things first, turn on the lights.
syntax enable

" let's not worry about the old days.
set nocompatible

" 80 character files are nice to ready, even
" on a 1080p display.
let &colorcolumn="80,".join(range(120,999),",")

" personally, I like seeing the line numbers
" of a file. can't really work otherwise.
set number

" let's keep a long running history.
set history=500

" prefer seeing where we are.
set cursorline

" show matching tokens.
set showmatch

" the one and only encoding.
set encoding=utf-8

" turn on detection of file types.
filetype on
filetype plugin on

" strategic indentation, please and thank you.
filetype indent on

" no annoying swap or backup files.
set nobackup
set nowb
set noswapfile

" team spaces!
set expandtab
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4

" :W will now save using sudo.
command W w !sudo tee % > /dev/null

" use the mouse if we can.
if has('mouse')
  set mouse=a
endif
