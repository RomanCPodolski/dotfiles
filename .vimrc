set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" =========================================
" Plugins 
" =========================================
Plugin 'gmarik/Vundle.vim' " let vundle manage itself
" airline for vim
Bundle 'bling/vim-airline'
" a git wrapper so awsome, is should be illegal
Bundle 'tpope/vim-fugitive'
" vim rails
Bundle 'tpope/vim-rails.git'
" Colortheme Darkmate
Bundle 'yearofmoo/Vim-Darkmate'
" ruby support
Bundle 'vim-ruby/vim-ruby'
" Sourround your code
Bundle 'tpope/vim-surround'
" auto add end keyword to ruby blocks
Bundle 'tpope/vim-endwise'
" Autogen pairs
Bundle 'jiangmiao/auto-pairs'
" plugin on GitHub repo
Bundle 'kchmck/vim-coffee-script'
" Editor Config
Bundle 'editorconfig/editorconfig-vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" file tree
Bundle 'scrooloose/nerdtree'
" commenting code
Bundle 'scrooloose/nerdcommenter'
" code completeion
Bundle 'valloric/youcompleteme'
" syntax checking
Bundle 'scrooloose/syntastic'
" Vim Javascript
Bundle 'pangloss/vim-javascript'
" Templates in vim
Bundle 'aperezdc/vim-template'
" Tagbar support
Bundle 'majutsushi/tagbar'
" Stylus support
Bundle 'wavded/vim-stylus'
" Jade support
Bundle 'digitaltoad/vim-jade'
" Gundo is a plugin to visualize vims undo tree.
Bundle 'sjl/gundo.vim'
" Snippets Engine
Bundle 'SirVer/ultisnips'
" Snippets
Bundle 'honza/vim-snippets'
" visualize line indentions
Bundle 'Yggdroot/indentLine'
" ag vim
Bundle 'rking/ag.vim'

call vundle#end()         " required
" =========================================
" Code Apperance 
" =========================================
syntax on                 " Enable syntax highlighting
set smartindent           " Smartindent lines
set tabstop=2             " Set tap stop to 2 withespaces
set shiftwidth=2          " Set shift wigth to 2 withespaces
set expandtab             " Expand tabs
filetype plugin indent on " Enable filetype-specific indenting and plugins

" =========================================
" Syntastic configuration
" =========================================

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1

" =========================================
" Filetypes 
" =========================================
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufNewFile,BufRead *.jade set filetype=jade

" =========================================
" Colorscheme - Vim apperance 
" =========================================
colorscheme darkmate

set nu

set wildmode=longest,list,full
set wildmenu

filetype plugin on
 set grepprg=grep\ -nH\ $*
 filetype indent on
 let g:tex_flavor='latex'

 syntax on

" Airlinebar config
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

nnoremap <F3> :Gstatus<CR>
nnoremap <F4> :Gdiff <CR>
nnoremap <F5> :GundoToggle <CR>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

" inoremap <leader>; <C-o>A;

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit bashrc
nnoremap <leader>eb :vsplit ~/.bashrc<cr>
nnoremap <leader>sb :! source ~/.bashrc<cr>
" Edit zshrc
nnoremap <leader>ez :vsplit ~/.zshrc<CR>
nnoremap <leader>sz :! source ~/.zshrc<CR>
" Edit  .gitignore
"nnoremap <leader>egi :vsplit :pwd/.gitignore<CR>
" Tab Mappings

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap to  :tabnew<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" no ugly line wrap
set nowrap

set history=200
