""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc       - My personal vimrc file
" Version:      5.0
" Maintainer:   Thiago Alves <talk@thiagoalves.com.br>
" Last Change:  March 15, 2015
" License:
" Copyright (C) 2015 Thiago Alves
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
" OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
" OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" First things first
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  " nocompatible (behave like Vim, not Vi)

set shellslash    " shellslash (use a common path separator across all platforms)
                  " convert all backslashes to forward slashes on expanding filenames.
                  " Enables consistency between Windows and Linux platforms, but
                  " BE CAREFUL! Windows file operations require backslashes, any paths
                  " determined manually (not by Vim) need to be reversed.

" Some helpers variables to find out where we're executing vim
let s:darwin = has('mac')
let s:windows = has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
let s:on_gui = has('gui_running')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:plug_window = 'tabnew'

silent! if plug#begin('~/.vim/plugged')
    " Theme
    Plug 'Townk/vim-theme' " my personal theme for colorscheme and Airline
    Plug 'bling/vim-airline' " nicer status bar
    Plug 'reedes/vim-colors-pencil' " nice light theme for focus writing
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'Konfekt/FastFold'

    " File type plugins
    Plug 'Townk/vim-qt', { 'for': [ 'cpp', 'qml', 'QMAKE' ] } " improve cpp syntax to recognise Qt types plus syntax and indent for other Qt files like QMAKE and QML
    Plug 'Townk/vim-json', { 'for': 'json' } " some helpers to edit and format json files
    Plug 'Townk/vim-logs', { 'for': [ 'syslog', 'apachelog' ] } " syntax highlights for some common log formats
    if s:darwin
        Plug 'itspriddle/vim-marked', { 'for': 'markdown' } " open current buffer on Marked app
    endif
    Plug 'bps/vim-textobj-python', { 'for': 'python' } " add function block (af/if) for python files
    Plug 'kana/vim-textobj-function', { 'for': ['cpp', 'c', 'java', 'vim' ] }  " add function text object (af/if)

    " VCS
    Plug 'airblade/vim-gitgutter' " displays a column showing the git status for hunks on current buffer
    Plug 'tpope/vim-fugitive' " awesome Git integration

    " System integration
    if s:darwin
        Plug 'rizzatti/dash.vim' " integrates with Dash documentation app on MacOS
    endif
    Plug 'tyru/open-browser.vim' " opens URLs on the system browser

    " Development
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' } " show indent guide lines when toggled
    Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' } " nice and lean and lean java omni completion
    Plug 'johnsyweb/vim-makeshift' " change the makeprg to the appropriate one and also change the pwd for the root of the project
    Plug 'scrooloose/syntastic' " syntax check for your code
    Plug 'tomtom/tcomment_vim' " comment lines on your buffer according to its file type
    Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " modify text to align lines on a given delimiter
    Plug 'mjbrownie/swapit' " enable <C-A> and <C-X> to swap words like 'true' and 'false', 'yes' and 'no', etc.
    Plug 'chrisbra/vim-diff-enhanced' " allow you to change the diff algorithm used while doing a file diff
    Plug 'SirVer/ultisnips' " text snippets!
    Plug 'honza/vim-snippets' " all the comunity snippets
    Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' } " create a pane with current buffer's tags listed
    Plug 'jszakmeister/markdown2ctags' " the markdown tag generator for tagbar
    Plug 'junegunn/vim-github-dashboard' " Github dashboard integration
    Plug 'glts/vim-textobj-comment' " add ic, ac and aC for comment text objects
    Plug 'davidhalter/jedi-vim', { 'for': 'python' } " Python completion
    Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' } " Plugin to make Vim recognize the virtualenv it's being running into
    Plug 'sukima/xmledit' " xml like helpers
    " Plug 'Shougo/neocomplete.vim'

    " Unite: Fuzzy search for vim
    Plug 'Shougo/vimproc.vim', { 'do': 'make' } " enable Unite to execute asynchronous calls
    Plug 'Shougo/unite.vim' " the fuzzy search plugin
    Plug 'Shougo/neomru.vim' " fuzzy search for most recent files
    Plug 'tsukkee/unite-help' " fuzzy search for vim help
    Plug 'Shougo/unite-outline' " fuzzy search for tags on current buffer

    " Tmux
    Plug 'christoomey/vim-tmux-navigator' " integrate vim with tmux while using <C-H>, <C-J>, <C-K> and <C-L>
    Plug 'christoomey/vim-tmux-runner' " allow you to execute commands on a tmux pane

    " Vim navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " file system drawer
    if !s:windows
        Plug 'rizzatti/greper.vim', { 'on': ['<Plug>GreperBangWord', '<Plug>GreperBangWORD', 'G'] } " better grep search
        Plug 'rizzatti/funcoo.vim', { 'on': ['<Plug>GreperBangWord', '<Plug>GreperBangWORD', 'G'] } " dependency library for Grepper
    endif
    Plug 'Soares/butane.vim' " better Buffer close that does not quit vim if buffer is the last on
    Plug 'milkypostman/vim-togglelist' " toggle local and quickfix window display
    Plug 'junegunn/goyo.vim' " distraction free editing
    Plug 'Lokaltog/vim-easymotion' " allow you to jump to any part of the text with few key strokes
    Plug 'kana/vim-textobj-user' " allow extra text objects to be created
    Plug 'reedes/vim-textobj-sentence' " add a better 'sentence' text object (as/is)
    Plug 'mattn/vim-textobj-url' " add URL text objects (au/iu)
    Plug 'kana/vim-textobj-indent' " add indent text object (ai/ii/aI/iI)
    Plug 'tpope/vim-repeat'

    " Editing
    Plug 'tpope/vim-abolish' " abbreviation and substitution syntax improvement
    Plug 'tpope/vim-surround' " manipulate text delimiters allowing you to remove, add or replace them
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " visually select the undo branch to use
    Plug 'terryma/vim-multiple-cursors' " enable multiple cursors in vim almost like SublimeText
    Plug 'ervandew/supertab' " uses <tab> to smart complete text while editing

    " Misc
    Plug 'junegunn/vim-emoji' " helper functions to convert text into emojis

    " Local projects
    " Plug '~/Projects/personal/vim/vim-javaproject'
    Plug '~/Projects/personal/vim/vim-better-markdown'

    call plug#end()
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.

" Let temporary files to be on their place!
if s:windows
    set backupdir=$HOME/_tmp,$HOME/Temp,/Windows/Temp,/WinNT/Temp,/Temp
    set directory=$HOME/_tmp,$HOME/Temp,/Windows/Temp,/WinNT/Temp,/Temp
else
    set backupdir=$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
    set directory=$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
endif

" Load some default macros that are not loaded by default on Vim
runtime macros/justify.vim
runtime macros/matchit.vim
if !exists("*EditExisting")
    runtime macros/editexisting.vim
endif

" The <LEADER> key is often set to "\", unfortunately this key has no standard
" location across different keyboards. To avoid you learning how to type on each
" new keyboard, let set <LEADER> key to "," which do have a standard location.
let mapleader=","



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on " detect the type of file
filetype plugin on " load file type plugins
filetype indent on " load file type indentation

set cf " enable error files and error jumping
set nospell " at the start we don't check spell all the time, if user want he can use the Ctrl+Alt+S
            " that we'll define on our mapping configuration

set ignorecase " for default we'll ignore cases on our searches
set smartcase " here we tell that if we put at least one letter in uppercase, than a case sensitive
              " search is made. To make a search sensitive with lowercase, just append or prepend a
              " \C in your search parameter, e.g. /\Clowercase or /lowercase\C
set smarttab " make sure <BS> deletes tab size of whitespaces

set title " let xterm shows vim information on its window title
behave xterm " default behavior to be exactly as in linux/xterm
confirm " if you try to quit from an unsaved file, Vim warns you about that and let you decide what
        " to do.

set history=1000 " How many lines of history to remember
set clipboard=unnamed " I want to share vim clipboard with the OS
set ffs=unix,dos,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,# " none of these should be word dividers, so make them not be
set wildignore="*.swp,*.bak,*.pyc,*.class" " ignore these files when expanding with %
set spellsuggest=10 " how many suggestions we want when we ask for it
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set ttimeoutlen=50 " make the timeout after a key press very short. This makes Airline update the
                   " normal mode when leaving insert.

set matchpairs+=<:>,=:; " make vim match <> as pairs to make it easy to jump on them using %

" tries to use the best grep tool available
if executable('ag')
    set grepprg=ag " Use Silver Searcher instead of grep
elseif executable('ack')
    set grepprg=ack " Use ACK instead of grep
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

syntax on " syntax highlighting on
" let's have 256 colors on graphical terminals :)
if s:darwin
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color " Gnome Terminal
    else
        set t_Co=256 " Everything else (tested on iTerm on Mac so far)
    endif
endif
if !empty(globpath(&rtp, 'colors/townklight.vim'))
    colorscheme townklight " a nice dark theme
endif
set cursorline " makes the current line highlighted



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set relativenumber " turn on relative numbers
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (Lazy Redraw)
set hidden " you can change buffer without saving
set linebreak " when wrap is on, make Vim break at the end of a word, not in the middle of it
set mousehide " hides mouse cursor while typing

set lsp=0 " space it out a little more (easier to read)
set wildmode=list:longest " make wildmenu behave like unix shell
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=a " use mouse everywhere
set mousemodel=popup_setpos " make the right click of the mouse trigger the pop-up menu
if !has('nvim')
    set ttymouse=sgr " make mouse scroll works on terminal as well
endif
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via ':' commands
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,diff:~ " make the splitters between windows be blank
set completeopt=longest,menuone " allow popup menu for completion but only if there is more than one opt available
set tabline=%!TabLine() " When using tabs, only show the file name on it




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set showcmd " Show how many lines we selected in VISUAL mode
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set novisualbell " don't blink
set noerrorbells " don't make noise
set showbreak=↪ " visually indicate a soft wrap

set mat=2 " how many tenths of a second to blink matching brackets for
set listchars=tab:¦.,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set scrolloff=2 " Keep 2 (top/bottom) for scope
set laststatus=2 " always show the status line
set showtabline=1 " Only show tabs if a tab is present
set tabpagemax=500 " maximum number of tab pages to be opened by the -p command line argument or the
                   " :tab all" command. (default 10)

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ [FORMAT=%{&ff}]\ %{exists('*fugitive#statusline')?fugitive#statusline():''}\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%([POS=%l,%v][%P]\ %)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai " auto indent
set si " smart indent
set cindent " do c-style indenting
set expandtab " replace tabs with space
set nowrap " do not wrap lines

set tw=80 " How long a comment should be before Vim automatically wraps the line
set fo=croqwanl2 " complex (type :he fo-table)
set cinoptions=>1s,e0,n0,:1s,=1s,l1,b0,g0,h1s,(s,W2,m1,j1,p0,t0
set cinwords+=try,catch
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is annoying in
"    anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable  " Turn on folding

set foldmethod=syntax " Make folding indent sensitive
set foldlevel=100 " Don't auto fold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

if exists("&foldchars")
    set foldcolumn=1
    set nofoldcolshowlvl
    set foldchars=fa:\ ,fo:▾,fc:▸
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" edit my dot vim files
nnoremap <silent>        <LEADER>ev  :e $MYVIMRC<CR>

" maps for buffer operations in normal mode on console
nnoremap <silent>        <LEADER>bn  :bnext<CR>g`"
nnoremap <silent>        <LEADER>bp  :bprevious<CR>g`"
nnoremap <silent>        <LEADER>bl  :b#<CR>g`"
nnoremap <silent>        <LEADER>bd  :Bclose<CR>
nnoremap <silent>        <LEADER>bx  :Bclose!<CR>

" Explore remote files
nnoremap <silent>        <LEADER>rf  :ExploreRemote<CR>
nnoremap <silent>        <LEADER>rF  :ExploreRemote!<CR>
nnoremap <silent>        <LEADER>rt  :ExploreRemoteToggle<CR>
nnoremap <silent>        <LEADER>rT  :ExploreRemoteToggle!<CR>
nnoremap <silent>        <LEADER>ro  :set ro!<CR>

" Help mapping for console vim
nnoremap <silent>        <LEADER>hw  :exec "help " . expand("<cword>")<CR>
nnoremap <silent>        <LEADER>hW  :exec "help " . expand("<cWORD>")<CR>

" Erase last search
nnoremap <silent>        <LEADER>hc  :let @/=""<CR>:echo "Search register cleaned"<CR>
" Enable and disable highlight search
nnoremap <silent>        <LEADER>ht  :set hlsearch!<CR>:echo &hlsearch==0?"Highlight search OFF":"Highlight search ON"<CR>

" Toggle spell checking on/off
nnoremap <silent>        <LEADER>st  :set spell!<CR>:echo &spell==0?"Spell checking OFF":"Spell checking ON"<CR>

" Source current file
nnoremap <silent>        <LEADER>sf  :so %<CR>:AirlineRefresh<CR>

" Toggle paste mode
nnoremap <silent>        <LEADER>sp  :set paste!<CR>:echo &paste==0?"Paste mode OFF":"Paste mode ON"<CR>
set pastetoggle=<F6> " I always try to have my shortcuts with LEADER but I want to use the pasttoggle

" Movements in wrapped lines.
nnoremap <silent>        <A-j>       gj
nnoremap <silent>        <Down>      gj
nnoremap <silent>        <A-k>       gk
nnoremap <silent>        <Up>        gk

" Easy moving of code blocks
vnoremap <silent>        <           <gv
vnoremap <silent>        >           >gv

" Insert block characters { and } on insert mode.
" <Ctrl>+<H> inserts { character on a new line
" <Ctrl>+<J> inserts { on the same line
inoremap <silent>        <C-H>       <C-O>:call AddBracesBlock(1)<CR>
vnoremap <silent>        <C-H>       :call AddBracesBlockToSelection(1)<CR>
inoremap <silent>        <C-L>       <C-O>:call AddBracesBlock(0)<CR>
vnoremap <silent>        <C-L>       :call AddBracesBlockToSelection(0)<CR>

" Insert ; at the end of a line when <Alt>; is pressed
inoremap <silent>        <M-;>       <C-O>A;

" Insert : at the end of a line when <Alt>: is pressed
inoremap <silent>        <M-:>       <C-O>A:

" Turn on/off line number and wrapper
" Line numbers
nnoremap <silent>        <LEADER>ln  :set number!<CR>:echo &number==0?"Line numbers OFF":"Line numbers ON"<CR>

" Turn on/off relative line number and wrapper
" Relative Line numbers
nnoremap <silent>        <LEADER>lr  :set relativenumber!<CR>:echo &relativenumber==0?"Relative line numbers OFF":"Relative line numbers ON"<CR>

" Text wrapping
nnoremap <silent>        <LEADER>lw  :set wrap!<CR>:echo &wrap==0?"Wrap lines on display OFF":"Wrap lines on display ON"<CR>

" Toggle SHOW SPECIAL CHARS
nnoremap <silent>        <LEADER>sc  :set nolist!<CR>

" Alternate header with implementation files
nnoremap <silent>        <LEADER>A   :cal AlternateFile()<CR>
nnoremap <silent>        <D-M-UP>    :cal AlternateFile()<CR>

" Search selected text
vnoremap                 <LEADER>ss  y/<C-R>"<CR>
if !s:windows
    " use the best 'grep' too available: ag -> ack -> grep
    vnoremap                 <LEADER>sa  y:G! /<C-R>"/<CR>
    nmap     <silent>        <LEADER>sa <Plug>GreperBangWord
    nmap     <silent>        <LEADER>sA <Plug>GreperBangWORD
endif

" Prettify JSON buffer
nnoremap                 <LEADER>ij  :silent %!python -m json.tool<CR>
" Prettify XML buffer
nnoremap                 <LEADER>ix  :silent %!xmllint --encode UTF-8 --format -<CR>

" QuickFix list navigation
nnoremap <silent>        [q          :cprevious<CR>
nnoremap <silent>        ]q          :cnext<CR>
nnoremap <silent>        [Q          :cfirst<CR>
nnoremap <silent>        ]Q          :clast<CR>

" Location list navigation
nnoremap <silent>        [l          :lprevious<CR>
nnoremap <silent>        ]l          :lnext<CR>
nnoremap <silent>        [L          :lfirst<CR>
nnoremap <silent>        ]L          :llast<CR>

" Horizontaly scroll
nnoremap <silent>        ˙           z20h
nnoremap <silent>        <A-h>       z20h
nnoremap <silent>        ¬           z20l
nnoremap <silent>        <A-l>       z20l

" Toggle folds
nnoremap <silent>        <Space>     za
vnoremap <silent>        <Space>     zf

" Map ",dt" to be a toggle between doxygen syntax On and Off
nnoremap <silent>        <LEADER>xt  :exec &syntax=~".doxygen$" ?
                                   \     "set syntax=".substitute(&syntax, ".doxygen", "", "") :
                                   \     "set syntax=".&syntax.".doxygen" <CR>:exec &syntax=~".doxygen$"?
                                   \         "echo 'Syntax DOXYGENed'":
                                   \         "echo 'Syntax NORMAL'"<CR>

" Makes <Enter>, <Esc>, <Tab>, <Shift>+<Tab>, <Up>, <Down>, <PgUp> and <PgDown> works as expected
" with complete popups.
inoremap <silent> <expr> <CR>        pumvisible() ? "\<C-Y>"                  : "\<CR>"
inoremap <silent> <expr> <PageDown>  pumvisible() ? "\<PageDown>\<C-P>\<C-N>" : "\<PageDown>"
inoremap <silent> <expr> <PageUp>    pumvisible() ? "\<PageUp>\<C-P>\<C-N>"   : "\<PageUp>"

" On insert mode allow insert a new line above or below the current line no mater the position of
" cursor
inoremap                 <C-CR>      <C-O>o
inoremap                 <C-S-CR>    <C-O>O
inoremap <silent> <expr> <C-J>       pumvisible() ? "\<Down>" : "\<C-O>o"
inoremap <silent> <expr> <C-K>       pumvisible() ? "\<Up>" : "\<C-O>O"

inoremap <silent>        <Home>      <C-R>=InsertHome()<CR>
nnoremap <silent> <expr> <Home>      strpart(getline(line('.')), 0, col('.')-1) =~ '\S' ?
                                   \     "^" :
                                   \     strpart(getline(line('.')), col('.')-1, 1) =~ '\s' ?
                                   \         "^" :
                                   \         "0"

" Move lines Up and Down and, if needed, indent them again
" Notice that using move doesn't cut the line, therefore our yank register keeps
" intact.
" Up
nnoremap <silent>        ˚           :move .-2<CR>==
nnoremap <silent>        <A-k>       :move .-2<CR>==
vnoremap <silent>        ˚           :move '<-2<CR>gv=gv
vnoremap <silent>        <A-k>       :move '<-2<CR>gv=gv
" Down
nnoremap <silent>        ∆           :move .+1<CR>==
nnoremap <silent>        <A-j>       :move .+1<CR>==
vnoremap <silent>        ∆           :move '>+1<CR>gv=gv
vnoremap <silent>        <A-j>       :move '>+1<CR>gv=gv

" Vim dev helper mapping to show syntax region under cursor
nnoremap                 <LEADER>sr  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                                       \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                                       \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Remove trailing whitespace
nnoremap <silent>        <LEADER>rs :%s/\s\+$//e<CR>:echo "Trailing whitespace removed!"<CR>

" Diff utils
" ,df will toggle diff between two open windows. Notice here that if you have more than 2 open
" windows, this shortcut will raise an error message.
" The other two mappings are simply wrappers to obtain and put plus a move to the next chunk.
nnoremap <silent> <LEADER>df   :call DiffToggle()<CR>
nnoremap <silent> <LEADER>do   do]c
nnoremap <silent> <LEADER>dp   dp]c


" Window layout switch
nnoremap <silent> <LEADER>sl   :call SwitchWindowLayout()<CR>

" Helper to keep the yank register when you paste a text on a selected one
xnoremap          p          pgvy

" Utility to toggle lock the current row in the middle of the screen
nnoremap <silent> <LEADER>zl  :let &scrolloff =  999 - &scrolloff<CR>
                            \ :echo &scrolloff > 900 ?
                            \     "Scroll locked on the center" :
                            \     "Scroll back to normal"<CR>

" Extending vim objects
let obj_delimiters = { '`'    : '`',
                     \ '.'    : '.',
                     \ ':'    : ':',
                     \ '/'    : '/',
                     \ '<bar>': '<bar>' }
for [ firstDelim, secondDelim ] in items(obj_delimiters)
    exec "nnoremap ci" . firstDelim . " T" . firstDelim . "ct" . secondDelim
    exec "nnoremap ca" . firstDelim . " F" . firstDelim . "cf" . secondDelim
    exec "nnoremap di" . firstDelim . " T" . firstDelim . "dt" . secondDelim
    exec "nnoremap da" . firstDelim . " F" . firstDelim . "df" . secondDelim
    exec "nnoremap yi" . firstDelim . " T" . firstDelim . "yt" . secondDelim
    exec "nnoremap ya" . firstDelim . " F" . firstDelim . "yf" . secondDelim
    exec "nnoremap g~i" . firstDelim . " T" . firstDelim . "g~t" . secondDelim
    exec "nnoremap g~a" . firstDelim . " F" . firstDelim . "g~f" . secondDelim
    exec "nnoremap gUi" . firstDelim . " T" . firstDelim . "gUt" . secondDelim
    exec "nnoremap gUa" . firstDelim . " F" . firstDelim . "gUf" . secondDelim
    exec "nnoremap gui" . firstDelim . " T" . firstDelim . "gut" . secondDelim
    exec "nnoremap gua" . firstDelim . " F" . firstDelim . "guf" . secondDelim
    exec "nnoremap g?i" . firstDelim . " T" . firstDelim . "g?t" . secondDelim
    exec "nnoremap g?a" . firstDelim . " F" . firstDelim . "g?f" . secondDelim
    exec "vnoremap i" . firstDelim . " T" . firstDelim . "ot" . secondDelim
    exec "vnoremap a" . firstDelim . " F" . firstDelim . "of" . secondDelim
endfor
unlet obj_delimiters

" Move around tabs
nnoremap <silent>        <LEADER>tl  :tablast<CR>
nnoremap <silent>        <LEADER>tn  :tabnext<CR>
nnoremap <silent>        <LEADER>tp  :tabprevious<CR>
nnoremap <silent>        <LEADER>tc  :tabclose<CR>

" Some window shortcuts
nnoremap <silent>        <C-W><C-J>  <C-W>s<C-W>j
nnoremap <silent>        <C-W><C-K>  <C-W>s<C-W>k
nnoremap <silent>        <C-W><C-H>  <C-W>v<C-W>h
nnoremap <silent>        <C-W><C-L>  <C-W>v<C-W>l
nnoremap <silent>        <LEADER>wz  :call ToggleWinZoonMode()<CR>

" Tag navigation
" Make sure we don't request a 'Press Enter' after finding a tag
nnoremap <silent>        <C-]>       :<C-U>execute 'tag ' . expand('<cword>')<CR>
" <Alt-]>
nnoremap <silent>        ‘           :tnext<CR>
" <Alt-[>
nnoremap <silent>        “           :tprevious<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"     new commands I create
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -bang -nargs=? ExploreRemote call ExploreRemote(<bang>0)
command! -bang -nargs=? ExploreRemoteToggle call ExploreRemoteToggle(<bang>0)

" command abbreviations
cabbrev Q q!
cabbrev Bw bw
cabbrev W w
cabbrev Wq wq



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
    " Ensure every file does syntax highlighting (full)
    autocmd! BufEnter            *              syntax sync fromstart

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost          *              if line("'\"") > 0 && line("'\"") <= line("$") |
                                              \     exe "normal g`\"" |
                                              \ endif

    " JSON file type
    autocmd! BufRead,BufNewFile  *.json         set filetype=json

    " Syslog types
    autocmd! BufRead,BufNewFile  *.log          set filetype=syslog

    " QML file type
    autocmd! BufRead,BufNewFile  *.qml          set filetype=qml

    " QMake
    autocmd! BufNewFile,BufRead  *.pro          set filetype=qmake
    autocmd! BufNewFile,BufRead  *.pri          set filetype=qmake

    " Git commits
    autocmd! BufNewFile,BufRead  COMMIT_EDITMSG set filetype=gitcommit

    " Objective-Cpp
    autocmd! BufNewFile,BufRead  *.mm           set filetype=objcpp

    " Gradle
    autocmd! BufNewFile,BufRead  *.gradle       set filetype=groovy

    " Java class files
    autocmd! BufRead,BufNewFile  *.jad          set filetype=java
    autocmd! BufRead,BufNewFile  *.class        set filetype=class

    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window. Protect against
    " screwing up folding when switching between windows.
    " autocmd InsertEnter          *              if !exists('w:last_fdm') |
    "                                           \    let w:last_fdm=&foldmethod |
    "                                           \    setlocal foldmethod=manual |
    "                                           \ endif
    " autocmd InsertLeave,WinLeave *              if exists('w:last_fdm') |
    "                                           \     let &l:foldmethod=w:last_fdm |
    "                                           \     unlet w:last_fdm |
    "                                           \ endif

    " Make sure that if we do any change on .vimrc or .gvimrc it gets reloaded 'automagically'
    augroup reload_vimrc
        autocmd!
        autocmd BufWritePost     $MYVIMRC       source $MYVIMRC |
                                              \ call airline#load_theme() |
                                              \ call airline#update_statusline()
        if s:on_gui
            autocmd BufWritePost $MYGVIMRC      source $MYGVIMRC |
                                              \ call airline#load_theme() |
                                              \ call airline#update_statusline()
        endif
    augroup END

    " Open help texts on new tabs instead of new window
    augroup HelpTabs
        autocmd!
        autocmd BufEnter         *.txt          call HelpInNewTab()
    augroup END

    " If Vim is resized I like to rearrange my windows so they have their size balanced
    autocmd VimResized           *              wincmd =

    " Make sure the bell doesn't beep on Insert mode
    augroup NoError
        autocmd!
        autocmd InsertEnter           *              call SetBell(1)
        autocmd InsertLeave           *              call SetBell(0)
    augroup END

    autocmd BufEnter             *             call CloseLastBuffer()
endif

function! CloseLastBuffer()
    if winnr("$") != 1
        return
    endif
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                \ || &buftype == 'quickfix'
        quit
    endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"     These functions are used on some mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These maps here enable the "smart" Home key. If you are on the first non blank character of line,
" <Home> will take you to the first column, in any other place <Home> take you to the first non
" blank character.
function! InsertHome()
    let l:action = "\<C-O>0"
    if strpart(getline(line('.')), 0, col('.')-1) =~ '\S' || strpart(getline(line('.')), col('.')-1, 1) =~ '\s'
        let l:action = "\<C-O>^"
    endif
    return l:action
endfunction

" insert the { } block on the text and position cursor between them.
" if newline parameter is true then the start brace will be inserted on the next line where the
" cursor is, otherwise it'll be inserted on the end of the same line.
function! AddBracesBlock(newline)
    let l:linenr = line('.')
    let l:line = getline(l:linenr)
    let l:blankline = (l:line =~ '^\s*$')

    if l:blankline
        if &expandtab
            let l:blk_ind = repeat(" ", indent(l:linenr-1))
            let l:prepend = repeat(" ", &shiftwidth)
        else
            let l:blk_ind = repeat("\<TAB>", indent(l:linenr-1)/&tabstop)
            let l:prepend = "\<TAB>"
        endif
        let l:before = ''
    else
        if &expandtab
            let l:blk_ind = repeat(" ", indent(l:linenr))
            let l:prepend = repeat(" ", &shiftwidth)
        else
            let l:blk_ind = repeat("\<TAB>", indent(l:linenr)/&tabstop)
            let l:prepend = "\<TAB>"
        endif
        let l:before = ' '
    endif

    call append(l:linenr, l:blk_ind . "}")
    call append(l:linenr, l:blk_ind . l:prepend)
    if !a:newline || l:blankline
        call setline(l:linenr, l:line . l:before . "{")
        let l:togo = l:linenr + 1
    else
        call append(l:linenr, l:blk_ind . "{")
        let l:togo = l:linenr + 2
    endif
    execute "normal " . l:togo . "G$"
endfunction

" does the same thing as AddBracesBlock but do it on a given range (used when there is a text
" selected)
function! AddBracesBlockToSelection(newline) range
    let l:begin = line("'<")
    let l:end = line("'>")
    let l:difsize = l:end - l:begin + 1
    if &expandtab
        let l:blk_ind = repeat(" ", indent(l:begin-1))
        let l:prepend = repeat(" ", &shiftwidth)
    else
        let l:blk_ind = repeat("\<TAB>", indent(l:begin-1)/&tabstop)
        let l:prepend = "\<TAB>"
    endif

    if indent(l:begin-1) == indent(l:begin)
        for i in range(l:difsize)
            call setline(l:begin+i, l:prepend . getline(l:begin+i))
        endfor
    endif

    call append(l:end, l:blk_ind . "}")
    if a:newline
        call append(l:begin-1, l:blk_ind . "{")
    else
        call setline(l:begin-1, getline(l:begin-1) . " {")
    endif
    normal gv
endfunction

" Switch from header file to implementation file (and vice versa).
function! AlternateFile()
    let path = expand('%:p:r').'.'
    let header_extensions = ['h', 'hh', 'H', 'HH', 'hxx', 'HXX', 'hpp', 'HPP']
    let impl_extensions = ['m', 'mm', 'c', 'cpp', 'C', 'CC']
    let is_header = (count(header_extensions, expand('%:e')) > 0)

    if is_header
        if !HasReadableExtensionIn(path, impl_extensions)
            echoh ErrorMsg | echo 'Alternate file not readable.' | echoh None
        endif
    else
        if !HasReadableExtensionIn(path, header_extensions)
            echoh ErrorMsg | echo 'Alternate file not readable.' | echoh None
        endif
    endif
endfunction

" Returns true and switches to file if file with extension in any of
" |extensions| is readable, or returns false if not.
function! HasReadableExtensionIn(path, extensions)
    for ext in a:extensions
        if filereadable(a:path.ext)
            exe 'e '.fnameescape(a:path.ext)
            return 1
        endif
    endfor
    return 0
endfunction

" Toggle Vexplore with Ctrl-E
function! ExploreRemote(resetHost)
    if !exists('g:remoteHost') || empty(g:remoteHost) || a:resetHost == 1
        let g:remoteHost = input('Remote host: ')
    endif
    if !empty(g:remoteHost)
        exec '1wincmd w'
        exec 'Vexplore ftp://' . g:remoteHost . '/'
        exec 'vertical resize 31'
    else
        echo 'Canceling remote explore.'
    endif
endfunction

function! ExploreRemoteToggle(resetHost)
    if exists('t:expl_buf_num')
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        call ExploreRemote(a:resetHost)
        let t:expl_buf_num = bufnr('%')
    endif
endfunction

" Fundtion to validate the amount od windows open.
" @param count - Maximum windows allowed on the current tab
" @param actoun_descr - The action to be displayed if there are less or more windows open than count
"                       allow
function! s:CheckWindowsCount(count, action_descr)
    let l:wincount = winnr('$')
    let l:result = 1
    if l:wincount != a:count
        echohl WarningMsg
        if l:wincount < 1
            echomsg "You can only " . a:action_descr . " with 2 windows. Currently you have only (" . l:wincount . ") window open"
        else
            echomsg "You can only " . a:action_descr . " with 2 windows. Currently you have (" . l:wincount . ") windows open"
        endif
        echohl NONE
        let l:result = 0
    endif
    return l:result
endfunction


" Define a function called DiffToggle.
" The ! overwrites any existing definition by this name.
function! DiffToggle()
    " Test the setting 'diff', to see if it's on or off.
    " (Any :set option can be tested with &name.
    " See :help expr-option.)
    if &diff
        for wnr in range(winnr("$"))
            execute wnr . " wincmd w"
            diffoff!
        endfor
        echo "Diff OFF for ALL windows"
        if exists('s:foldSize')
            exec "set foldcolumn=" . s:foldSize
        endif
    elseif s:CheckWindowsCount(2, "do diff")
        let s:foldSize = &foldcolumn
        wincmd t
        diffthis
        wincmd b
        diffthis
        echo "Diff ON for " . expand('%')
    endif
endfunction


" Opens the help buffer on a new window
" The ! overwrites any existing definition by this name.
function! HelpInNewTab()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
        nnoremap <buffer> q :tabclose<CR>
    endif
endfunction

" Defines the entire tab line to be displayed when more than one tab is opened
function! TabLine()
    let s = ''
    let prev_selected = 0
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#['
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{TabLabel(' . (i + 1) . ')} '

        if i + 1 == tabpagenr()
            let s .= ']'
        endif
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999X❌  '
    endif

    return s
endfunction

" Helper function to return the file name of a buffer on a given tab
function! TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return a:n . " " . fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

" Toggle window layout on the Zoon mode.
" The Zoon mode will make the focus window bigger than the others
function! ToggleWinZoonMode()
    if &winminwidth == 1
        let &winwidth = 999
        let &winminwidth = 35
        let &winheight = 5
        let &winminheight = 5
        let &winheight = 999
        exe "wincmd l"
        exe "wincmd h"
        exe "wincmd j"
        exe "wincmd k"
    else
        try
            let &winminwidth = 1
        catch /.*/
        endtry
        let &winwidth = 20
        let &winheight = 10
        let &winminheight = 1
        let &winminwidth = 1
        exe "wincmd ="
    endif
    AirlineRefresh
endfunction

" Enable or Disable the system bell
function! SetBell(disable)
    if a:disable
        let s:mybell = [&eb, &vb, &t_vb]
        " need to set visualbell, else bell will still be called.
        set noeb vb t_vb=
    else
        let [&eb, &vb, &t_vb] = s:mybell
    endif
endfunction

" Makes a douple pane layout swap between horizontal and vertical.
" Notice that if you try co call this function on a layout with more than two windows on it, it'll
" not work
function! SwitchWindowLayout()
    if s:CheckWindowsCount(2, "switch layout orientation")
        let l:cur_win = winnr()
        wincmd t
        echo "width=" . winwidth(l:cur_win) . ", height=" . winheight(l:cur_win)
        if winwidth(l:cur_win) == &co
            wincmd H
        else
            wincmd K
        endif
        execute l:cur_win . " wincmd w"
    endif
endfunction

" Toggle trailing white spaces matches
function! ToggleTrailWhiteSpace(on)
    if a:on
        let w:TrailWhitespaceID = matchadd("TrailWhitspace", '\s\+$')
        highlight TrailWhitspace ctermbg=red guibg=red
    elseif exists("w:TrailWhitespaceID")
        call matchdelete(w:TrailWhitespaceID)
        unlet w:TrailWhitespaceID
    endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Third-party script integration
"     Any variable set or custom mapping needed by a script is made in this section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nnoremap <silent> <F2>       :NERDTreeToggle<CR>
inoremap <silent> <F2>       <C-O>:NERDTreeToggle<CR>
nnoremap <silent> <S-F2>     :NERDTreeFind<CR>
inoremap <silent> <S-F2>     <C-O>:NERDTreeFind<CR>
nnoremap <silent> <LEADER>nt :NERDTreeToggle<CR>
nnoremap <silent> <LEADER>nT :NERDTreeFind<CR>

let g:NERDTreeQuitOnOpen  = 1
let g:NERDTreeDirArrows   = 1
let g:NERDTreeStatusline  = "  "
let g:NERDTreeMinimalUI   = 1
let g:NERDTreeHijackNetrw = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 50
let g:undotree_DiffpanelHeight = 25
let g:undotree_SetFocusWhenToggle = 1

nnoremap <silent> <F5>       :UndotreeToggle<CR>
nnoremap <silent> <LEADER>u  :UndotreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips
let g:UltiSnipsUsePythonVersion    = 3   " or 3
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
if s:windows
    let g:UltiSnipsSnippetsDir = $HOME . "/vimfiles/ultisnips"
else
    let g:UltiSnipsSnippetsDir = $HOME . "/.vim/ultisnips"
endif

function! UltiSnipsCallUnite()
    Unite -start-insert -immediately -no-empty ultisnips
    return ''
endfunction
inoremap <silent> <C-B> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimpager
let vimpager_use_gvim = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
noremap <silent> <LEADER>hi :Helptags<CR>:echo "Help tags updated for Pathogen bundles"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
nnoremap <silent> <LEADER>gs  :Gstatus<CR>
nnoremap <silent> <LEADER>gw  :Gwrite<CR>
nnoremap <silent> <LEADER>gr  :Gread<CR>
nnoremap <silent> <LEADER>gc  :Gcommit<CR>
nnoremap <silent> <LEADER>gm  :Gcommit --amend<CR>
nnoremap <silent> <LEADER>gl  :Glog<CR>
nnoremap <silent> <LEADER>gb  :Gblame<CR>
nnoremap <silent> <LEADER>gh  :Gbrowse<CR>
nnoremap <silent> <LEADER>gd  :Gdiff<CR>
nnoremap <silent> <LEADER>go  :diffoff!<CR>
                            \ :wincmd b<CR>
                            \ :if exists('b:fugitive_type') \| wincmd c \| wincmd b \| endif<CR>
                            \ :2wincmd h<CR>
                            \ :if exists('b:fugitive_type') \| wincmd c \| endif<CR>
nnoremap <silent> <LEADER>gO  :diffoff!<CR>:wincmd j<CR>:2wincmd h<CR>:wincmd l<CR>:only<CR>

autocmd BufReadPost fugitive://*  set bufhidden=delete
autocmd User        fugitive      if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
                                    \   nnoremap <buffer> .. :edit %:h<CR> |
                                    \ endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
nnoremap <silent> <F4>        :TagbarToggle<CR>
nnoremap <silent> <LEADER>tb  :TagbarToggle<CR>

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 0
let g:tagbar_autoshowtag = 1

" Add support for markdown files in tagbar.
let mkd2ctags_list = split(globpath(&rtp, 'markdown2ctags.py'))
if empty(mkd2ctags_list)
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images:1',
            \ 'l:links:1',
        \ ],
        \ "sort" : 0,
    \ }
else
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : mkd2ctags_list[0],
        \ 'ctagsargs' : '-f - --sort=no',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images',
            \ 'l:links',
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
endif
unlet mkd2ctags_list
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToggleList
let g:toggle_list_no_mappings = 1
nnoremap <silent> <LEADER>qt :call ToggleQuickfixList()<CR>
nnoremap <silent> <LEADER>lt :call ToggleLocationList()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NetRW
let g:netrw_browse_split = 4
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3
let g:netrw_silent = 1
let g:netrw_special_syntax = 1
let g:netrw_altv             = 1
let g:netrw_winsize          = 26
let g:netrw_menu             = 0
let g:netrw_use_errorwindow  = 0

if s:windows
  " uses PuTTY on windows
    let g:netrw_scp_cmd  = 'pscp -q -batch'
    let g:netrw_sftp_cmd = 'psftp'
    let g:netrw_cygwin   = 0
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
let g:SuperTabDefaultCompletionType        = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-i>"
let g:SuperTabLongestEnhanced              = 1
let g:SuperTabLongestHighlight             = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
" TODO: find a way to check if Unite is present before trying to call these functions
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('buffer,file,file_mru,file_rec,help','sorters','sorter_rank')
call unite#custom#source('file_rec/async', 'ignore_pattern', '.idea/\|.gradle/\|.build/')
call unite#custom#source('file_rec/git', 'ignore_pattern', '.idea/\|.gradle/\|.build/')
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'short_source_names': 1,
\   'auto_resize': 1,
\   'winheight': 10,
\   'direction': 'topleft',
\ })

let g:unite_source_history_yank_enable = 1

" To track long mru history.
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000
" For optimize.
let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_filename_format = ''

" Prompt choices.
let g:unite_prompt = '> '

" Use ag for search, if not present, fall back to ack and if that is not present
" just use normal grep
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

if filereadable('/usr/local/bin/ctags')
    let g:unite_source_outline_ctags_program='/usr/local/bin/ctags'
endif

" The prefix key.
nnoremap [unite]    <Nop>
nmap     <LEADER>f  [unite]

" Actions
nnoremap [unite]f   :<C-u>Unite -buffer-name=Files\ (recursive)             file_rec/async:!<cr>
nnoremap [unite]l   :<C-u>Unite -buffer-name=Files\ (current\ directory)    file<cr>
nnoremap [unite]r   :<C-u>Unite -buffer-name=Recent\ Files                  file_mru<cr>
nnoremap [unite]o   :<C-u>Unite -buffer-name=Outline                        outline<cr>
nnoremap [unite]h   :<C-u>Unite -buffer-name=Help                           help<cr>
nnoremap [unite]b   :<C-u>Unite -buffer-name=Open\ Buffers -no-start-insert buffer<cr>
nnoremap [unite]y   :<C-u>Unite -buffer-name=Copy\ History                  history/yank<cr>
nnoremap [unite]p   :<C-u>Unite -buffer-name=Project\ Files                 file_rec/git<cr>
nnoremap [unite]g   :<C-u>exec "Unite -buffer-name=Grep grep:.::" . expand("<cword>")<cr>
nnoremap [unite]G   :<C-u>exec "Unite -buffer-name=Grep grep:.::" . expand("<cWORD>")<cr>

" Global shortcuts
nmap <F3>       :<C-u>silent Unite -buffer-name=Open\ Buffers -no-start-insert buffer<cr>


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " nmap <buffer> <F3> <Plug>(unite_all_exit)
    " Play nice with supertab
    let b:SuperTabDisabled=1
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <silent> <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> ga      <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AirLine
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 1

let g:airline_theme='townkpowerline'
let g:airline_powerline_fonts=1

" .vimrc reload workaround:
"     For our convenience we defined that every time our vimrc is saved, we
"     re-load it. This causes the AirLine to disappears because we'll re-set the
"     status line. The solution for this problem is, in the end of our vimrc,
"     check if we have AirLine available and force it to re-load itself.
if exists("*airline#update_statusline") && exists("*airline#load_theme")
    call airline#update_statusline()
    call airline#load_theme()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dash
if s:darwin
    nmap <silent> <LEADER>k <Plug>DashSearch
    nmap <silent> <LEADER>K <Plug>DashGlobalSearch
    let g:dash_map = {
    \    'python' : ['python3', 'django', 'twisted', 'sphinx', 'flask', 'cvp'],
    \    'java'   : 'android'
    \}
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine
let g:indentLine_char = '┆' " ¦, ┆, ︙ or │
let g:indentLine_noConcealCursor = 1
let g:indentLine_fileTypeExclude = ['text', 'md']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_enabled = 0
nnoremap <silent> <LEADER>is :IndentLinesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VTR
"let g:VtrUseVtrMaps = 1
let g:VtrClearOnResize = 1
let g:VtrAppendNewline = 1
let g:VtrGitCdUpOnOpen = 1
let g:VtrInitialCommand = 'PROMPT="$\ "PROMPT2="\>\ "RPROMPT='

vnoremap <silent> <F8>         :VtrSendLinesToRunner<CR>
nnoremap <silent> <F8>         :VtrSendLinesToRunner<CR>
nnoremap <silent> <LEADER>vs   :VtrSendCommandToRunner<CR>
nnoremap <silent> <LEADER>vl   :VtrSendLinesToRunner<CR>
nnoremap <silent> <LEADER>vo   :VtrOpenRunner<CR>
nnoremap <silent> <LEADER>vk   :VtrKillRunner<CR>
nnoremap <silent> <LEADER>vc   :VtrClearRunner<CR>
nnoremap <silent> <LEADER>vr   :VtrReorientRunner<CR>
nnoremap <silent> <LEADER>vf   :VtrFocusRunner<CR>
nnoremap <silent> <LEADER>vd   :VtrDetachRunner<CR>
nnoremap <silent> <LEADER>va   :VtrReattachRunner<CR>
nnoremap <silent> <LEADER>vf   :VtrFlushCommand<CR>
nnoremap <silent> <LEADER>vp   :VtrOpenRunner {'cmd': g:VtrInitialCommand.'ipython'}<CR>:VtrFlushCommand<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nnoremap <silent> <LEADER>gg  :<C-U>call openbrowser#open('http://github.com/' . expand('<cfile>'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["java"] }


silent! if emoji#available()
    let g:syntastic_error_symbol = emoji#for('no_entry')
    let g:syntastic_style_error_symbol = emoji#for('exclamation')
    let g:syntastic_warning_symbol = emoji#for('warning') " for some reason I can't get this symbol with emoji: ⚠️
    let g:syntastic_style_warning_symbol = emoji#for('grey_exclamation')
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java Complete
if exists('*javacomplete#SetSearchdeclMethod')
    call javacomplete#SetSearchdeclMethod(1)
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makeshift
let g:makeshift_chdir = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
let g:goyo_width = 82
let g:goyo_margin_top = 7
let g:goyo_margin_bottom = 7

if s:darwin && s:on_gui
    nnoremap <silent> <LEADER>zo :<C-U>Goyo<CR>:set fu!<CR>
elseif !s:on_gui
    nnoremap <silent> <LEADER>zo :<C-U>silent !tmux set -g status<CR>:Goyo<CR>
else
    nnoremap <silent> <LEADER>zo :<C-U>Goyo<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Github Dashboard
" let g:github_dashboard = { 'username': 'Townk', 'password': $VIM_GITHUB_API_TOKEN }
" nnoremap <silent> <LEADER>ga  :<C-U>exec "GHActivity " . expand("<cfile>")<CR>
" nnoremap <silent> <LEADER>gA  :<C-U>GHActivity<CR>
" nnoremap <silent> <LEADER>gb  :<C-U>exec "GHDashboard " . expand("<cword>")<CR>
" nnoremap <silent> <LEADER>gB  :<C-U>GHDashboard<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Marked
nnoremap <silent> <LEADER>md :<C-U>MarkedOpen<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TComment
let g:tcommentTextObjectInlineComment = ''
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
let g:markdown_fenced_languages = ['cpp', 'c', 'java', 'sh', 'python', 'html']
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
nnoremap <silent> <LEADER>pc :<C-U>PlugClean<CR>
nnoremap <silent> <LEADER>pd :<C-U>PlugDiff<CR>
nnoremap <silent> <LEADER>pi :<C-U>PlugInstall<CR>
nnoremap <silent> <LEADER>ps :<C-U>PlugStatus<CR>
nnoremap <silent> <LEADER>pu :<C-U>PlugUpdate<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML-Edit
let xml_use_xhtml = 1
let xml_use_html = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi
let g:jedi#force_py_version = 3
" let g:jedi#popup_on_dot = 0
" let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#use_splits_not_buffers = "left" " can be 'left', 'right', 'bottom', 'top' or 'winwidth'
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Virtualenv Helper
"     If I do have a virtualenv active, give it a chance to load its own .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif



" vim:tw=100:ts=4:sw=4:expandtab:
