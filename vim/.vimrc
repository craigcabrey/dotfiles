set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" first things first, turn on the lights.
syntax enable

" let's not worry about the old days.
set nocompatible

" move fast, highlight things
set incsearch

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

" please darling, give us some space.
set so=5

" menu for figuring out what to edit
set wildmenu

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

" for the inevitable opening and closing of the same file(s).
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" use the mouse if we can.
if has('mouse')
  set mouse=a
endif

" Because I have to use the shift key all the time and I'm stupid
:command WQ wq
:command Wq wq
:command W w
:command Q q
