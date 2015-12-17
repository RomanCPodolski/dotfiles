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
" Colortheme Solarized
Bundle 'altercation/vim-colors-solarized'
" ruby support
Bundle 'vim-ruby/vim-ruby'
" Sourround your code
Bundle 'tpope/vim-surround'
" auto add end keyword to ruby blocks
Bundle 'tpope/vim-endwise'
" Autogen pairs
Bundle 'tpope/vim-repeat'
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
" vim jasmine
Bundle 'claco/jasmine.vim'
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
" Cmake
Bundle 'jalcine/cmake.vim'
" Latex
Bundle 'lervag/vimtex'
" LISP
Bundle 'kovisoft/slimv'
Bundle 'takac/vim-spotifysearch'
Bundle 'rdnetto/ycm-generator'
Bundle 'jeaye/color_coded'

call vundle#end()         " required
" =========================================
" Vim Apperance / Code Apperance 
" =========================================
syntax on                 " Enable syntax highlighting
set autoindent
set smartindent           " Smartindent lines
set nowrap                " No Ugly linewrap
set history=500
set smartcase
set showmatch
set title
set ruler
set et
set number
set relativenumber
set incsearch
set autoread
set autowrite
set noswapfile " no stupid swp files
set exrc
set secure

filetype plugin indent on " Enable filetype-specific indenting and plugins

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" =========================================
" Syntastic configuration
" =========================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1

set nu

set wildmode=longest,list,full
set wildmenu

" =========================================
" Custom Mappings 
" =========================================

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff <CR>
nnoremap <leader>gb :Gblame <CR>

nnoremap <leader>ru :RuboCop <CR>

" set spellchecking
nnoremap <leader>sc :setlocal spell<cr>
nnoremap <C-U> :GundoToggle <CR>
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <C-T> :TagbarToggle<CR>

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
map <leader>ev :vsplit $MYVIMRC<cr>
map <leader>sv :source $MYVIMRC<cr>

" Edit zshrc
map <leader>ez :vsplit ~/.zshrc<CR>
map <leader>sz :! source ~/.zshrc<CR>
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

"shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" new commands
" write to readonly file
cnoremap sudow w !sudo tee % >/dev/null

" =========================================
" UtilSnips Configurations
" =========================================
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

" Better key bindings for UtilSnipsExpandTrigger
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termcolors=256    "default value is 16
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab colorcolumn=80 
  autocmd FileType markdown setlocal spell spelllang=en complete+=kspell
  autocmd FileType latex setlocal spell spelllang=en complete+=kspell
  autocmd FileType gitcommit setlocal spell spelllang=en complete+=kspell
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab colorcolumn=80
  autocmd FileType ruby nnoremap <leader>r !ruby %<cr>
endif
