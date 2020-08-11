if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype off                  " required
set autoindent

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/seoul256.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"for javascript
Plug 'pangloss/vim-javascript'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map <C-p> :Prettier<CR>

syntax on
let g:seoul256_background = 233
colorscheme seoul256

let g:prettier#autoformat_require_pragma = 0

"for javascript
let g:javascript_plugin_jsdoc = 1





