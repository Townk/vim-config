""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvimrc      - Only GUI Vim configurations (GVim)
" Version:      3.0
" Maintainer:   Thiago Alves <contact@thiagoalves.org>
" Last Change:  October 24, 2010
" License:      This file is placed in the public domain.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guioptions=aegim     " make vim less clutter

set encoding=utf-8       " Use UTF-8 everywhere.

set cmdheight=2          " the command bar is 2 high
set lines=45 columns=150 " Window dimensions.

if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
  set guifont=Consolas:h11
elseif has("mac") || has("macunix")
  set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h13
  set antialias                     " MacVim: smooth fonts.

  " some configurations only available to MacVim
  if has("gui_macvim")
    set macmeta " let option key (alt) be used as Meta on Vim
    set fuoptions=maxvert,maxhorz,background:Normal " full screen options
  endif
else
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

" Since we use the same colorscheme for terminal and gui vim, there is no need to re-define it here.
" I'll let the line comment though as documentation of how change your theme for gui vim
"colorscheme townklight " back to the dark background!

" If we decide to use a different colorscheme from terminal, we need to redefine the annoyingspace 
" highlight. This is needed because the different colorscheme ususally clean up all syntax before 
" start changing its colors.
"autocmd BufNewFile,BufRead * syntax match annoyingspace '^\(\t\+ \| \+\t\)\|[\t ]\+$' | highlight annoyingspace ctermbg=red guibg=red

