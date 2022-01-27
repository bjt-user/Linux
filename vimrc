if $COLOR=='OFF'
	set t_Co=0
endif

filetype plugin on
syntax on

" show line numbers "
set number

set autoindent
set smartindent

set tabstop=2

" use 2 spaces when indenting with << or >> "
set shiftwidth=2

nmap <F5> :!clear;./% <CR>

nmap <F6> :!clear;bash -x % <CR>

nmap <F7> :!clear;python3 % <CR>

nmap <F8> :!clear;java % <CR>

"improving the switching between windows (helpful for splits and nerdtree)
"(ctrl+h to go to left window)
"(ctrl+l to go to right window)
"(ctrl+k to go to upper window)
"(ctrl+j to go to bottom window)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" STATUS LINE ------------------------------------------------------------ {{{
" spaces are escpaed with "\ " "

set statusline=

set statusline+=%F
set statusline+=\ %M
set statusline+=\ %Y
set statusline+=\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l
set statusline+=\ col:\ %c
set statusline+=\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
