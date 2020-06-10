" Use 24-bit (true-color) mode in Vim.
if (has("termguicolors"))
	set termguicolors
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

"let g:onedark_termcolors=256
"let g:onedark_terminal_italics=1
"let g:airline_theme='onedark'
"colorscheme onedark

colorscheme Tomorrow-Night-Bright

"colorscheme base16-tomorrow-night
"colorscheme molokai

let g:airline_theme='dark'

