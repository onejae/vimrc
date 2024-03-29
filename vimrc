if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype indent off
filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle']  }   
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle'  }
Plug 'tpope/vim-surround'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-vinegar'

"for javascript
Plug 'pangloss/vim-javascript'

"for ts
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"for go
Plug 'fatih/vim-go'

"md file preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }


call plug#end()

nmap ,c :CtrlSF<space>
map ,n :NERDTreeTabsToggle<CR>
map ,r :NERDTreeFind<CR>

map ,f :FZF<CR>
map <C-p> :Prettier<CR>
cmap tn<CR> tabnew<CR>

syntax on
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256

highlight Normal ctermbg=black ctermfg=white

colorscheme gruvbox

let g:prettier#autoformat_require_pragma = 0

"for golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"for javascript
let g:javascript_plugin_jsdoc = 1

"for coc 
let g:coc_disable_startup_warning = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-h> :vertical res +5<CR>
nnoremap <C-g> :vertical res -5<CR>

"for bookmark
" highlight BookmarkSign ctermbg=NONE ctermfg=160
" highlight BookmarkLine ctermbg=20 ctermfg=NONE
" let g:bookmark_sign = '♥'
" let g:bookmark_highlight_lines = 1


"for hjkl move on command mode
cmap <C-k> <Up>
cmap <C-j> <Down>
cmap <C-h> <Left>
cmap <C-l> <Right>
map q <Nop>
map <C-s> :w<CR>
cnoremap SF<CR> :CtrlSF<CR>
nmap     <S-F>t :CtrlSFToggle<CR>
nmap     <S-F>n <Plug>CtrlSFCwordPath
nmap     <S-F>p <Plug>CtrlSFPwordPath


nmap <C-J> :bprevious<CR> 
nmap <C-K> :bnext<CR> 


nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-right> :vertical res +5<CR>
nnoremap <silent> <C-left> :vertical res -5<CR>
nnoremap <silent> <C-up> :res +1<CR>
nnoremap <silent> <C-down> :res -1<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
nnoremap ,. :CocAction<CR>
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
vmap <C-_> <Plug>NERDCommenterToggle<CR>
map ,r :NERDTreeFind<cr>


se nu
set ts=2
set shiftwidth=4
set autoindent 
set expandtab
set belloff=all


function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_x = ""
    let g:airline_section_y = ""
    let g:airline_section_z = "wonjae lee"
    let g:airline_section_warning = ""
endfunction

autocmd VimEnter * call AirlineInit()

set guifont=NanumGothicCoding

set mouse=a

set ignorecase
set noswapfile

let g:nerdtree_tabs_open_on_console_startup=1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 1

let g:ctrlsf_backend = 'rg'

" for tabbar
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine ctermfg=Blue ctermbg=Black
hi TabLineSel ctermfg=Red ctermbg=White

" for CocFloat
hi CocErrorFloat ctermfg=White

