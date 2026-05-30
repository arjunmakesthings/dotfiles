"turn off old compatibility with vi.
set nocompatible

"turn off auto swap file creation. 
set noswapfile

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

	"for status-bar (airline):
	Plugin 'vim-airline/vim-airline'

	"for vundle; github: 
	Plugin 'tpope/vim-fugitive'

	"auto match brackets: 
	Plugin 'jiangmiao/auto-pairs'

	"tidal cycles: 
	Plugin 'tidalcycles/vim-tidal'
call vundle#end()

"re-enable filtype & load filetype-specific plugins.
filetype plugin indent on

"ui:
syntax on
set number

"nerdtree: 
let NERDTreeShowBookmarks=1

"always show status line, even if it's one window.
set laststatus=2

"airline / status bar: 
"change defaults to none:
let g:airline_extensions = []
"a is mode.
let g:airline_section_a = '%{airline#parts#mode()}'
"show file + absolute path, readonly or not:  
let g:airline_section_b = '%F %r'
"show git stuff & whether the file is modified or not:
let g:airline_section_c = '%m %{airline#extensions#branch#get_head()}'
let g:airline_section_x = ''
"show type of file being edited.
let g:airline_section_y = '%y'
"show line / total lines:
let g:airline_section_z = '%l/%L'

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
"don't copy comments: 
"autocmd FileType * setlocal formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"keybindings:
""for nerdtree:
inoremap<c-b> <Esc>:NERDTreeToggle<cr>
nnoremap<c-b> <Esc>:NERDTreeToggle<cr>
"if you don't want to use nerdtree:
"nnoremap<c-b> <Esc>:Lex<cr>:vertical resize 30<cr>

"specific software:

