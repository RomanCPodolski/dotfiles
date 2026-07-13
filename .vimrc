set nocompatible

filetype plugin indent on

syntax on

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start
set hidden
set laststatus=2
set display=lastline

set showmode
set showcmd

set incsearch
set hlsearch

set ttyfast
set lazyredraw

set splitbelow
set splitright

set cursorline
set wrapscan
set report=0
set synmaxcol=200


set nu
set relativenumber

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set backup
call mkdir(expand('$HOME/.vim/files/backup'), 'p')
call mkdir(expand('$HOME/.vim/files/swap'), 'p')
call mkdir(expand('$HOME/.vim/files/undo'), 'p')
call mkdir(expand('$HOME/.vim/files/info'), 'p')

set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip=
set directory=$HOME/.vim/files/swap//
set updatecount=100
set undofile
set undodir=$HOME/.vim/files/undo/
set viminfo='100,n$HOME/.vim/files/info/viminfo

colorscheme apprentice
