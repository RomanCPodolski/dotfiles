set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" =========================================
" Plugins 
" =========================================
Plug 'L9'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'
Plug 'aperezdc/vim-template'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'wellsjo/wellsokai.vim'
Plug 'yearofmoo/Vim-Darkmate'
" ruby plugins
Plug 'tpope/vim-endwise', {'for' : 'ruby'}
Plug 'ngmy/vim-rubocop', {'for' : 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
Plug 'benmills/vimux' | Plug 'skalnik/vim-vroom', {'for' : 'ruby'}
Plug 'danchoi/ri.vim', {'for' : 'ruby'}
Plug 'astashov/vim-ruby-debugger', {'for' : 'ruby'}
" python plugins
Plug 'fs111/pydoc.vim', {'for' : 'python'}
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
Plug 'jalcine/cmake.vim', {'for' : 'cmake'}
Plug 'lervag/vimtex', {'for' : 'tex'}
Plug 'rdnetto/ycm-generator', {'branch' : 'stable', 'for' : 'cpp'}
Plug 'JamshedVesuna/vim-markdown-preview', {'for' : 'markdown'}
call plug#end()

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

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

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
"let g:syntastic_ruby_checkers = ['mri', 'rubylint', 'rubocop', 'reek', 'flog']
let g:syntastic_ruby_checkers = [ 'rubocop']
let g:syntastic_python_checkers = ['pylint']

set nu

set wildmode=longest,list,full
set wildmenu

" =========================================
" Custom Mappings 
" =========================================



let g:ri_no_mappings=1
nnoremap  ,ri :call ri#OpenSearchPrompt(0)<cr> " horizontal split
nnoremap  ,RI :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  ,RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup

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
let g:ycm_python_binary_path = "/usr/bin/python"

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
"let g:solarized_termcolors=256    "default value is 16
"syntax enable
"set background=dark
"colorscheme solarized
"colorscheme wellsokai
colorscheme darkmate
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
  autocmd FileType markdown setlocal spell spelllang=en complete+=kspell
  autocmd FileType latex setlocal spell spelllang=en complete+=kspell
  autocmd FileType gitcommit setlocal spell spelllang=en complete+=kspell
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab colorcolumn=80
  autocmd FileType ruby let g:vroom_use_vimux=1
  autocmd FileType ruby let g:vroom_use_bundle_exec=1
endif
