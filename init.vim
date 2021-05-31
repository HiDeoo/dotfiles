" Enable line numbers.
set number
set relativenumber
set scrolloff=3

" Highlight current line.
set cursorline

" Ignore case in searches.
set ignorecase

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the filename in the window titlebar.
set title

" Tabs configuration.
set tabstop=2
set shiftwidth=2
set expandtab

" Plugins.
call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Colors & Scheme.
colorscheme snazzy

" Airline configuration.
set laststatus=2
let g:airline_theme='base16_snazzy'
let g:airline_section_z = airline#section#create(['%3p%%', 'linenr', 'maxlinenr'])
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = ' ¶'
