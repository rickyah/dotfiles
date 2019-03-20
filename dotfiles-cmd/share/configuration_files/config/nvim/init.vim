set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
set runtimepath+=/usr/local/opt/fzf

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

let &packpath = &runtimepath

source ~/.vimrc
