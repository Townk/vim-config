""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvimrc      - Only GUI Vim configurations (GVim)
" Version:      3.1
" Maintainer:   Thiago Alves <contact@thiagoalves.org>
" Last Change:  February 27, 2015
" License:      This file is placed in the public domain.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guioptions=aegim     " make vim less clutter

set encoding=utf-8       " Use UTF-8 everywhere.

set cmdheight=2          " the command bar is 2 high
set lines=50 columns=160 " Window dimensions.

if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
  set guifont=Consolas:h11
elseif has("mac") || has("macunix")
  set guifont=InputMonoCondensed\ ExLight:h12
  set antialias                     " MacVim: smooth fonts.

  " some configurations only available to MacVim
  if has("gui_macvim")
    set macmeta " let option key (alt) be used as Meta on Vim
    set fuoptions=maxvert,maxhorz,background:Normal " full screen options
  endif
else
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

" We only map this if we're in GUI mode
nnoremap <silent>        <LEADER>eg  :e $MYGVIMRC<CR>
