"turn off old compatibility with vi.
set nocompatible

"temporarily disable filetype detection so that plugins load. 
filetype off

"set the runtime path to include vundle, and initialize:
set rtp+=~/.vim/bundle/Vundle.vim

"start vundle plugin block:
call vundle#begin()
	"let vundle manage vundle. this is, somehow, required.
	Plugin 'VundleVim/Vundle.vim'

	"load prettier:
	"packloadall
	Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

	"nerdtree is my file explorer.
	Plugin 'preservim/nerdtree'

	"theme:
	Plugin 'arcticicestudio/nord-vim'

	"for glsl:
	Plugin 'tikhomirov/vim-glsl'
call vundle#end()

"re-enable filtype & load filetype-specific plugins.
filetype plugin indent on

"ui:
syntax on
set number

"always show status line, even if it's one window.
set laststatus=2

"colorscheme:
colorscheme nord

" more writing stuff:
set encoding=utf-8
" word-wrap
set wrap
" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr
"preserve indentation when pressing return:
set smartindent

"keybindings:
""for nerdtree:
inoremap<c-b> <Esc>:NERDTreeToggle<cr>
nnoremap<c-b> <Esc>:NERDTreeToggle<cr>
"if you don't want to use nerdtree:
"nnoremap<c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
