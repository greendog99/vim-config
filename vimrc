set nocompatible   " don't try to be vi compatible
set encoding=UTF-8
let mapleader=" "  " Change leader from /
filetype plugin on
set t_Co=256

" Load plugins
source ~/.vim/plugins.vim

" Set theme
source ~/.vim/theme.vim

"
" My Stuff
"
inoremap jk <ESC>

syntax on          " syntax highlighting
set number         " line numbers in left margin
set nowrap         " don't wrap lines
set showmatch      " highlight matching brace
set list           " show invisible characters
set cpoptions+=$   " show $ at end of word change
set visualbell     " no beeping!
set gcr=a:blinkon0 " no blinking cursor
set scrolloff=3    " keep some context lines at top and bottom
"set cursorline     " highlight the current line

" Movement
set backspace=indent,eol,start    " Fix backspace indent
" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

"" Indentation
set autoindent     " auto indent new lines
set shiftwidth=2   " autoindent two spaces
set smartindent    "
set smarttab       "
set tabstop=2      " tabs take up two visual spaces
set softtabstop=2  " tabs add two spaces when editing
set expandtab      " use spaces instead of tabs

"" List chars
set listchars=""              " Reset the listchars
set listchars=tab:▸\          " show tab markers
set listchars+=extends:>      " The character to show in the last column when wrap is
                              " off and the line continues beyond the right of the screen
set listchars+=precedes:<     " The character to show in the last column when wrap is on
" set listchars+=eol:¬        " show EOL markers
" set listchars+=trail:.      " show trailing spaces as dots

"" Searching
set hlsearch       " highlight matches
set incsearch      " incremental searching
set ignorecase     " searches are case insensitive...
set smartcase      " ... unless they contain at least one capital letter
" turn off search highlighting with <CR>
nnoremap <CR> :nohlsearch<CR><CR>
" Recenter after next/previous search result:
nnoremap n nzzzv
nnoremap N Nzzzv

"" Wild settings
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*,*/tmp/*,*.so
set wildignore+=*.pyc,*.db,*.sqlite

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Underline the current line with '=' or '-'
nmap <silent> <leader>ul :t.<CR>Vr=
nmap <silent> <leader>uL :t.<CR>Vr-

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Adjust viewports to the same size
map <Leader>= <C-w>=

