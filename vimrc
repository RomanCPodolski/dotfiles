set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" =========================================
" Plugins
" =========================================
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
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
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'wellsjo/wellsokai.vim'
Plug 'yearofmoo/Vim-Darkmate'
" python plugins
Plug 'fs111/pydoc.vim', {'for' : 'python'}
Plug 'klen/python-mode', {'for' : 'python'}
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim'
Plug 'jalcine/cmake.vim', {'for' : 'cmake'}
Plug 'lervag/vimtex', {'for' : 'tex'}
Plug 'DamienCassou/textlint', {'for' : 'tex'}
Plug 'beloglazov/vim-online-thesaurus'
Plug 'rust-lang/rust.vim'
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
"let g:syntastic_python_python_exec = '/Users/romancpodolski/anaconda/bin/python'
let g:syntastic_python_checkers = ['python', 'pylint','pyflakes', 'pep8']
let g:syntastic_cpp_checkers = ['cpplint', 'cppcheck', 'cpp']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1

let g:syntastic_python_checkers = ['python', 'pylint', 'pyflakes', 'pep8']
let g:syntastic_cpp_checkers = ['cpplint', 'cppcheck', 'gcc']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

set nu

set wildmode=longest,list,full
set wildmenu

" =========================================
" Custom Mappings
" =========================================


nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff <CR>
nnoremap <leader>gb :Gblame <CR>

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
" set listchars=tab:▸\ ,eol:¬, trail:·,
set lcs=tab:▸\ ,eol:¬
" new commands
" write to readonly file
cnoremap sudow w !sudo tee % >/dev/null

" =========================================
" vimtex configurations
" =========================================
let g:vimtex_view_method = 'skim'
" =========================================
" UtilSnips Configurations
" =========================================
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:SuperTabDefaultCompletionType = '<C-n>'

nnoremap gt :YcmCompleter GoTo<CR>
"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_python_binary_path = "/usr/bin/python"

map <F9> :YcmCompleter FixIt<CR>

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

"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"let g:solarized_diffmode="normal"
"let g:solarized_hitrail=0
"let g:solarized_menu=1


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_method='pplatex'

augroup filetypedetect
        au BufRead,BufNewFile wscript setfiletype python
augroup END

if has("autocmd")
  filetype on
  autocmd FileType c,cpp,objc setlocal ts=2 sts=2 sw=2 expandtab colorcolumn=80
  autocmd FileType c,cpp,objc ClangFormatAutoEnable
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  "autocmd FileType cpp let &path.="/usr/local/include,/usr/include/AL"
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType markdown setlocal spell spelllang=en complete+=kspell
  autocmd FileType tex setlocal spell spelllang=en complete+=kspell concealcursor=
  autocmd FileType tex let b:vimtex_main = 'main.tex'
  autocmd FileType gitcommit setlocal spell spelllang=en complete+=kspell
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab colorcolumn=80
  autocmd FileType c,cpp,python autocmd BufWritePre <buffer> %s/\s\+$//e
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  "autocmd FileType c,cpp,python autocmd BufWritePre <buffer> %s/,\(\S\)/, \1/g
endif
