-- Alias various helper variables.
local opt = vim.opt -- Options.
local cmd = vim.cmd -- Vim commands.

-- Enable relative line numbers.
opt.number = true
opt.relativenumber = true
opt.scrolloff = 3

-- Highlight current line.
opt.cursorline = true

-- Ignore case in searches.
opt.ignorecase = true

-- Show the filename in the window titlebar.
opt.title = true

-- Tabs configuration.
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Use smart indentation.
opt.smartindent = true

-- Load packages.
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- package manager
  use 'connorholyday/vim-snazzy' -- theme
  use 'lukas-reineke/indent-blankline.nvim' -- indentation guides
  use 'tpope/vim-fugitive' -- git
  use 'airblade/vim-gitgutter' -- git gutter
  use 'bling/vim-airline' -- status line
  use 'vim-airline/vim-airline-themes' -- status line themes
end)

-- Configure theme.
cmd 'colorscheme snazzy'
cmd([[
  hi Normal ctermbg=16 guibg=#121212
  hi LineNr ctermbg=16 guibg=#121212 guifg=#383837
]])

-- Fix color scheme search highlight colors
cmd 'autocmd ColorScheme * highlight Search guibg=#ff6ac1'
cmd 'autocmd ColorScheme * highlight IncSearch guibg=#ff6ac1'

-- Configure indentation guides.
vim.g.indent_blankline_char = '│'

-- Configure status line.
opt.laststatus = 2
cmd([[
  let g:airline_theme='base16_snazzy'

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_section_z = airline#section#create(['%3p%%', 'linenr', 'maxlinenr'])

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' Ξ '
  let g:airline_symbols.notexists = '!'
  let g:airline_symbols.maxlinenr = ' ¶'
]])
