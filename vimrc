if $COLOR=='OFF'
	set t_Co=0
endif

filetype plugin on
syntax on

" set the color scheme (only recommended for Powershell):
"color industry

" show line numbers "
set number

set autoindent
set smartindent
set tabstop=2
" to make <tab> and <<,>> use spaces instead of actual tab:
set expandtab

" use 2 spaces when indenting with << or >> "
set shiftwidth=2

"KEYBINDINGS (keybindings for plugins are further down)
nmap <F2> :!clear;chmod +x % <CR>

" <bar> is needed to change between internal vim commands and terminal
" commands
" shortcut to save file, clear terminal and execute file:
nmap <F5> :w <bar> !clear;./% <CR>

nmap <F6> :w <bar> !clear;bash -x % <CR>

nmap <F7> :w <bar> !clear;python3 % <CR>

nmap <F8> :w <bar> !clear;java % <CR>


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
