"
" vim-plug
" https://github.com/junegunn/vim-plug
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Basics
Plug 'mileszs/ack.vim'                  " Search in project/directory
Plug 'vim-airline/vim-airline'          " Fancy status bar and tab bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file find
Plug 'vim-scripts/ZoomWin'
Plug 'preservim/nerdtree'               " File explorer tree
Plug 'preservim/nerdcommenter'          " Code comment wrangling
Plug 'jeetsukumaran/vim-buffergator'    " Navigation of open buffers
Plug 'tpope/vim-surround'               " Change quotes, braces, etc.
Plug 'bronson/vim-trailing-whitespace'  " Highlight in red. Can fix.
Plug 'easymotion/vim-easymotion'
"Plug 'ervandew/supertab'              " Insert mode tab completion
"Plug 'tpope/vim-sensible'             " Sensible defaults
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Issues with icons

" Coding
Plug 'vim-syntastic/syntastic'        " Syntax checking
Plug 'jelera/vim-javascript-syntax'   " Better JS syntax highlighting
Plug 'hail2u/vim-css3-syntax'         " CSS3 syntax in addition to builtin css
Plug 'ap/vim-css-color'               " Show color previews, e.g. #ff0000
Plug 'elzr/vim-json'                  " JSON formatting
Plug 'tpope/vim-endwise'              " Auto-add 'end' for Ruby code
Plug 'airblade/vim-gitgutter'         " Show git change markers
Plug 'mattn/gist-vim'                 " Create gists from vim
Plug 'sheerun/vim-polyglot'           " Language syntax
"Plug 'davidhalter/jedi-vim'           " Python code autocompletion
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-projectionist'
"Plug 'thoughtbot/vim-rspec'
"Plug 'ecomba/vim-ruby-refactoring'

" Color themes
Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'chriskempson/base16-vim'
"Plug 'joshdick/onedark.vim'
"Plug 'tomasr/molokai'

Plug 'ryanoasis/vim-devicons'         " Use icons throughout vim. Load last.
Plug 'tpope/vim-repeat'               " Enable repeating (.) of plugin mappings

call plug#end()

"
" Customizations for some plugins
"

"--------------------------
" Ack
"

" Use The Silver Searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Don't jump to first result automatically
cnoreabbrev Ack Ack!
" Map to Leader-a
nnoremap <Leader>a :Ack!<Space>
" Open result in middle of window
let g:ack_mappings = { "o": "<CR>zz" }

"--------------------------
" Airline
"

let g:airline_powerline_fonts=1              " use powerline fonts
let g:airline#extensions#tabline#enabled=1   " smart top tab bar
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git)$|node_modules',
	\ 'file': '\.pyc$\|\.pyo$\|\~$\',
	\ }

"--------------------------
" CtrlP
"

" Order matching files top-to-bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
" Always open files in new buffers
let g:ctrlp_switch_buffer = 0
" Respect updated vim CWD
let g:ctrlp_working_path_mode = 0
" Use The Silver Searcher if available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

"--------------------------
" Easymotion
"

" <LL-s> to use Easymotion with multi-char search
nmap <Leader><Leader>s <Plug>(easymotion-sn)

"--------------------------
" NERDCommenter
"

" add a space after comment delimeter
let g:NERDSpaceDelims=1
" <L-/> to toggle comments
map <leader>/ <plug>NERDCommenterToggle<CR>

"--------------------------
" NERDTree
"

" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1     " Close NERDTree after opening a file
let NERDTreeChDirMode=3      " Change CWD when tree root is changed
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" Use one tree buffer across all tabs
"nnoremap <leader>nn :NERDTreeToggle<CR>:NERDTreeMirror<CR>

