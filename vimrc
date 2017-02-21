" Syntax highlighting.
syntax enable

" Use iMproved Vi.
set nocompatible

" Disable filetype detection.
filetype off

" Include Vundle & initialize it.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Plugins list.
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-sleuth'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/gist-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'gabesoft/vim-ags'
Plugin 'ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" End of Plugins list.
call vundle#end()
filetype plugin indent on

" Colors & Scheme.
set background=dark
colorscheme solarized

" Leader configuration.
let mapleader = ","
let g:mapleader = ","

" Airline configuration.
set laststatus=2
set t_Co=256
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␊ '
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.linenr = '¶ '
let g:airline#extensions#branch#symbol = '⎇ '
let g:airline#extensions#paste#symbol = 'ρ'
let g:airline#extensions#paste#symbol = 'Þ'
let g:airline#extensions#paste#symbol = '∥'
let g:airline#extensions#whitespace#symbol = 'Ξ'

" Enhance command-line completion.
set wildmenu

" Allow cursor keys in insert mode.
set esckeys

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Optimize for fast terminal connections.
set ttyfast

" Add the g flag to search/replace by default.
set gdefault

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files.
set binary
set noeol

" Centralize backups, swapfiles and undo history.
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories.
set backupskip=/tmp/*,/private/tmp/*

" Enable line numbers.
set number
set relativenumber
set scrolloff=3

" Enable syntax highlighting.
syntax on

" Highlight current line.
set cursorline

" Highlight searches.
set hlsearch

" Ignore case of searches.
set ignorecase

" Highlight dynamically as pattern is typed.
set incsearch

" Enable mouse in all modes.
" set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position.
set ruler

" Show the filename in the window titlebar.
set title

" Defines the clipboard name.
set clipboard=unnamed

" Tabs configuration.
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" Gist configuration.
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Easymotion configuration.
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Rainbow Parentheses.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Force quit alias.
nmap fq :q!<CR>

" Ctrlp.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic configuration.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nmap <leader>st :SyntasticToggleMode<cr>

" Splits.
set splitbelow
set splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
