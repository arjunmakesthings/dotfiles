set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"auto complete:
packloadall
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

call vundle#begin()
 Plugin 'preservim/nerdtree'
 Plugin 'arcticicestudio/nord-vim'
 Plugin 'tikhomirov/vim-glsl'
call vundle#end()

colorscheme nord

syntax on
set number

filetype on

" word-wrap
set wrap
" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr

"preserve indentation when pressing return:
set smartindent

set laststatus=2

set encoding=utf-8

inoremap<c-b> <Esc>:NERDTreeToggle<cr>
nnoremap<c-b> <Esc>:NERDTreeToggle<cr>

"if you don't want to use nerdtree:
"nnoremap<c-b> <Esc>:Lex<cr>:vertical resize 30<cr>



