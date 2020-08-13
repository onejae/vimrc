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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"for javascript
Plug 'pangloss/vim-javascript'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map <C-p> :Prettier<CR>

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
