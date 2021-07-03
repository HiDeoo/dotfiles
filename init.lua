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

-- Load package manager.
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

-- Make the package manager manage itself.
paq {'savq/paq-nvim', opt = true}

-- Add theme.
paq {'connorholyday/vim-snazzy'}
cmd 'colorscheme snazzy'

-- Add Indentation guides.
paq {'lukas-reineke/indent-blankline.nvim'}
vim.g.indent_blankline_char = '│'

-- Add git and git gutter decorations.
paq {'tpope/vim-fugitive'}
paq {'airblade/vim-gitgutter'}

-- Add custom status line.
paq {'bling/vim-airline'}
paq {'vim-airline/vim-airline-themes'}
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
