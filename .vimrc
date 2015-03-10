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
" Coffeescript support for tagbar
Bundle 'lukaszkorecki/CoffeeTags'
" Stylus support
Bundle 'wavded/vim-stylus'
" Jade support
Bundle 'digitaltoad/vim-jade'
" Gundo is a plugin to visualize vims undo tree.
Bundle 'sjl/gundo.vim'
" Supertab
Bundle 'ervandew/supertab'
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
" Vim Apperance / Code Apperance 
" =========================================
syntax on                 " Enable syntax highlighting
set autoindent
set smartindent           " Smartindent lines
set tabstop=2             " Set tap stop to 2 withespaces
set shiftwidth=2          " Set shift wigth to 2 withespaces
set expandtab             " Expand tabs
set nowrap                " No Ugly linewrap
set history=500
set smartcase
set showmatch
set title
set ruler
set et
set number
set incsearch
set hlsearch
set autoread
set autowrite

filetype plugin indent on " Enable filetype-specific indenting and plugins
colorscheme darkmate
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

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

set nu

set wildmode=longest,list,full
set wildmenu

filetype plugin on
 set grepprg=grep\ -nH\ $*
 filetype indent on
 let g:tex_flavor='latex'

 syntax on

" =========================================
" Custom Mappings 
" =========================================

nnoremap <F3> :Gstatus<CR>
nnoremap <F4> :Gdiff <CR>
nnoremap <F5> :GundoToggle <CR>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
" Disable Arrow keys 
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

" =========================================
" UtilSnips Configurations
" =========================================
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Better key bindings for UtilSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" =========================================
" Tagbar configuration (Stolen from
" https://github.com/tomw42/vimrc/blob/master/.vimrc)
" =========================================
"
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
if executable('coffeetags')
    let g:tagbar_type_coffee = {
        \ 'ctagsbin'  : 'coffetags',
        \ 'ctagsargs' : '',
        \ 'kinds'     : [
            \ 'c:classes',
            \ 'm:methods',
            \ 'f:functions',
            \ 'v:variables',
            \ 'f:fields',
            \ 'o:object',
        \ ],
        \ 'sro': ".",
        \ 'kind2scope': {
        \ 'f': 'object',
        \ 'o': 'object',
        \ }
        \ }
endif
