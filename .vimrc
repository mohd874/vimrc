" Review  the following references for this file configurations:
" - https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim' " Auto indentation
Plugin 'scrooloose/syntastic' " Check Syntax
Plugin 'nvie/vim-flake8' " Check code against PEP8
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' " Super Search
Plugin 'tpope/vim-fugitive' " Git integration
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline' " Powerline devariant. 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Simplify navigation between split view 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" To see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let python_highlight_all=1
let g:airline_powerline_fonts = 1

syntax on

set nu " Line Numbering
set hls " Highlight search results
set cul " Highlight the screen line of the cursor with CursorLine
set title " Add the file name to the window title (can be configured)
set sm " Same as `:substitute`, but always use 'magic'.
set ts=4 " Tab width
set sts=4
set sw=4 " Number of spaces to use for each step of (auto)indent.
set sta " inserts blanks according to 'shiftwidth' (sw).
set et " In Insert mode: Use the appropriate number of spaces to insert a
   	" <Tab>.  Spaces are used in indents with the '>' and '<' commands and
	" when 'autoindent' is on.
set ai " Auto Indent: Copy indent from current line when starting a new line
set nobk " No Backup for files
set enc=utf-8 " Set encoding to UTF-8
set backspace=2 " make backspace work like most other apps

set guifont=Droid_Sans_Mono_Dotted_for_Powe:h12

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" Switch between light and dark theme
call togglebg#map("<F5>")
