if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype indent off

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'crusoexia/vim-monokai'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jiangmiao/auto-pair
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdcommenter'

"for javascript
Plug 'pangloss/vim-javascript'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map <C-p> :Prettier<CR>
cmap tn<CR> tabnew<CR>

syntax on
colorscheme monokai

let g:prettier#autoformat_require_pragma = 0

"for javascript
let g:javascript_plugin_jsdoc = 1

"for coc 
let g:coc_disable_startup_warning = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"for bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=20 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1


"for hjkl move on command mode
cmap <C-k> <Up>
cmap <C-j> <Down>
cmap <C-h> <Left>
cmap <C-l> <Right>
map q <Nop>
map <C-s> :w<CR>
cnoremap SF<CR> :CtrlSF<CR>
nnoremap <S-f> :CtrlSFToggle<CR>

nnoremap <silent> <S-C-l> :tabn<CR>
nnoremap <silent> <S-C-h> :tabp<CR>
nnoremap <silent> <S-C-p> :vertical res +5<CR>
nnoremap <silent> <S-C-o> :vertical res -5<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <TAB> <C-w>w


" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

se nu
set ts=4
set shiftwidth=4
set autoindent 
set expandtab

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_x = ""
    let g:airline_section_y = ""
    let g:airline_section_z = "wonjae lee"
    let g:airline_section_warning = ""
endfunction

autocmd VimEnter * call AirlineInit()

set mouse=a
set ignorecase


"for vimspector
let g:vimspector_enable_mappings = 'HUMAN'
