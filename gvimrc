""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvimrc      - Only GUI Vim configurations (GVim)
" Version:      3.0
" Maintainer:   Thiago Alves <contact@thiagoalves.org>
" Last Change:  October 24, 2010
" License:      This file is placed in the public domain.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme topfunky-light " for graphical vim I choose a lighter background
colorscheme townklight " back to the dark background!

set guioptions=aegim " make vim less clutter

set cmdheight=2 " the command bar is 2 high
set lines=35 columns=120 " Window dimensions.

if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
    set guifont=Consolas:h11
elseif has("mac") || has("macunix")
    set guifont=Inconsolata:h16       " Font family and font size.
    set antialias                     " MacVim: smooth fonts.
else
    set guifont=Monaco\ 10
endif

set encoding=utf-8                " Use UTF-8 everywhere.

" some configurations only available to MacVim
if has("gui_macvim")
    set macmeta " let option key (alt) be used as Meta on Vim
    set fuoptions=background:Normal " full screen options
endif

" Show stupid extra empty spaces
" although we already defined this on our .vimrc we need to do it again because the colorscheme
" can erase all previous match syntaxes
autocmd BufNewFile,BufRead * syntax match annoyingspace '^\(\t\+ \| \+\t\)\|[\t ]\+$' | highlight annoyingspace ctermbg=red guibg=red

