""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc       - My personal vimrc file
" Version:      4.5
" Maintainer:   Thiago Alves <talk@thiagoalves.com.br>
" Last Change:  February 4, 2013
" License:      This file is placed in the public domain.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" First things first
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  " nocompatible (behave like Vim, not Vi)

set shellslash    " shellslash (use a common path separator across all platforms)
                  " convert all backslashes to forward slashes on expanding filenames.
                  " Enables consistancy between Windows and Linux platforms, but
                  " BE CAREFUL! Windows file operations require backslashes, any paths
                  " determined manually (not by Vim) need to be reversed.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make vim behave more like TexMate in relation to its plugins
" This plugin (pathogen) makes Vim looks into a directory called 'bundles' and
" add it to the runtime path. This way you keep each plugin file separated
" from each other.
" I added a second "bundle" directory called libs so I can separate scripts that are needed by other 
" scripts and the ones that actually do something for me
runtime libs/pathogen/autoload/pathogen.vim
execute pathogen#infect('bundle/{}', 'libs/{}')

set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.

" Let temporary files to be on their place!
if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
    set backupdir=$HOME/_tmp,$HOME/Temp,/Windows/Temp,/WinNT/Temp,/Temp
    set directory=$HOME/_tmp,$HOME/Temp,/Windows/Temp,/WinNT/Temp,/Temp
else
    set backupdir=$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
    set directory=$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
endif

" Load some default macros that are not loaded by default on Vim
runtime macros/justify.vim
runtime macros/matchit.vim
"runtime macros/editexisting.vim

" The <LEADER> key is often set to "\", unfortunately this key is not placed on a standard place
" on a lot of keyboards. To avoid you of learning how to type on each new keyboard, lets set 
" <LEADER> key to ","
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

set title " let xterm shows vim information on its window title
behave xterm " default behavior to be exactly as in linux/xterm
confirm " if you try to quit from an unsaved file, Vim warns you about that and let you decide what
        " to do.

set history=1000 " How many lines of history to remember
set clipboard-=unnamed " turns out I do not stand sharing windows clipboard any more
set ffs=unix,dos,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,# " none of these should be word dividers, so make them not be
set wildignore="*.swp,*.bak,*.pyc,*.class" " ignore theese files when expanding with %
set spellsuggest=10 " how many suggestions we whant when we ask for it



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " syntax highlighting on
" let's have 256 colors on graphical terminals :)
if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color " Gnome Terminal
else
    set t_Co=256 " Everything else (tested on iTerm on Mac so far)
endif
colorscheme railscasts " a nice dark theme
set cursorline " makes the current line highlighted


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom 
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
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via ':' commands
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,diff:~ " make the splitters between windows be blank
set completeopt=longest,menuone " allow popup menu for completion but only if there is more than one opt available


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set showcmd " Show how many lines we selected in VISUAL mode
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set novisualbell " don't blink
set noerrorbells " don't make noise

set mat=2 " how many tenths of a second to blink matching brackets for
set listchars=tab:¦.,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set scrolloff=2 " Keep 2 (top/bottom) for scope
set laststatus=2 " always show the status line
set showtabline=1 " Only show tabs if a tab is present
set tabpagemax=500 " maximum number of tab pages to be opened by the -p command line argument or the
                      " :tab all" command. (default 10)

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ [FORMAT=%{&ff}]\ %{fugitive#statusline()}\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%([POS=%l,%v][%P]\ %)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai " auto indent
set si " smart indent 
set cindent " do c-style indenting
set expandtab " replace tabs with space
set nowrap " do not wrap lines  

set tw=100 " How long a comment should be before Vim automatically wraps the line
set fo=croqwanl2 " complex (type :he fo-table)
set cinoptions=>1s,e0,n0,:1s,=1s,l1,b0,g0,h1s,(s,W4,m1,j1,p0,t0
set cinwords+=try,catch
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" edit my dot vim files
nmap  <silent> <leader>ev    :e $MYVIMRC<CR>
nmap  <silent> <leader>eg    :e $MYGVIMRC<CR>

" maps for navigation in normal mode on console
nmap  <silent> <LEADER>bn    :bnext<CR>g`"
nmap  <silent> <LEADER>bp    :bprevious<CR>g`"
nmap  <silent> <LEADER>bl    :b#<CR>g`"

" Toggle QuickFix window
nmap  <silent> <LEADER>qt    :QFix<CR>

" Explore remote files
nmap  <silent> <LEADER>rf    :ExploreRemote<CR>
nmap  <silent> <LEADER>rn    :ExploreRemote!<CR>

" Help mapping for console vim
nmap  <silent> <LEADER>hw    :exec "help " . expand("<cword>")<CR>
nmap  <silent> <LEADER>hW    :exec "help " . expand("<cWORD>")<CR>

" Erase last search
nmap  <silent> <LEADER>hc    :let @/=""<CR>:echo "Search register cleaned"<CR>
" Enable and disable highlight search
nmap  <silent> <LEADER>ht    :set hlsearch!<CR>:echo &hlsearch==0?"Highlight search OFF":"Highlight search ON"<CR>

" Toggle spell checking on/off
nmap  <silent> <LEADER>st    :set spell!<CR>:echo &spell==0?"Spell checking OFF":"Spell checking ON"<CR>

" Source current file
nmap  <silent> <LEADER>sf    :so %<CR>

" Movements in wrapped lines.
nmap  <silent>  <A-J>        gj
nmap  <silent>  <Down>       gj
nmap  <silent>  <A-K>        gk
nmap  <silent>  <Up>         gk

" Insert block characters { and } on insert mode.
" <Ctrl>+<H> inserts { character on a new line
" <Ctrl>+<J> inserts { on the same line
inoremap <silent> <C-H>      <C-O>:call AddBracesBlock(1)<CR>
vnoremap <silent> <C-H>      :call AddBracesBlockToSelection(1)<CR>
inoremap <silent> <C-L>      <C-O>:call AddBracesBlock(0)<CR>
vnoremap <silent> <C-L>      :call AddBracesBlockToSelection(0)<CR>

" Insert ; at the end of a line when <Alt>; is pressed
inoremap <silent> <M-;>      <C-O>A;

" Insert : at the end of a line when <Alt>: is pressed
inoremap <silent> <M-:>      <C-O>A:

" Turn on/off line number and wrapper
" Line numbers
nnoremap <silent> <LEADER>ln :set number!<CR>:echo &number==0?"Line numbers OFF":"Line numbers ON"<CR>

" Turn on/off relative line number and wrapper
" Relative Line numbers
nnoremap <silent> <LEADER>lr :set relativenumber!<CR>:echo &relativenumber==0?"Relative line numbers OFF":"Relative line numbers ON"<CR>

" Text wrapping
nnoremap <silent> <LEADER>lw :set wrap!<CR>:echo &wrap==0?"Wrap lines on display OFF":"Wrap lines on display ON"<CR>

" Toggle SHOW SPECIAL CHARS
nnoremap <silent> <LEADER>sc :set nolist!<CR>

" On visual mode, <Tab> and <Shift><Tab> indent and unindent block
xnoremap <silent> <Tab>      >gv
xnoremap <silent> <S-Tab>    <gv

" Alternate header with implementation files
nmap  <silent> <LEADER>A     :cal AlternateFile()<CR>
nmap  <silent> <D-M-UP>      :cal AlternateFile()<CR>

" Search selected text
vmap  <LEADER>ss             y/<C-R>"<CR>

" Prettify JSON buffer
map  <LEADER>ij              :silent %!python -m json.tool<CR>
" Prettify XML buffer
map  <LEADER>ix              :silent %!xmllint --encode UTF-8 --format -<CR>

" QuickFix list navigation
nmap <silent> [q             :cprevious<CR>
nmap <silent> ]q             :cnext<CR>
nmap <silent> [Q             :cfirst<CR>
nmap <silent> ]Q             :clast<CR>

" Horizontaly scroll
nmap  <silent> <C-L>         zL
nmap  <silent> <C-H>         zH
if has("unix") " On unix systems, Shift+MouseScroll scrolls text horizontally
    map   <silent> <S-MouseDown> z2h
    map   <silent> <S-MouseUp>   z2l
endif

" Map ",dt" to be a toggle between doxygen syntax On and Off
nmap  <silent> <LEADER>xt   :exec &syntax=~".doxygen$" ? 
    \"set syntax=".substitute(&syntax, ".doxygen", "", "") : 
    \"set syntax=".&syntax.".doxygen" <CR>:exec &syntax=~".doxygen$"?
        \"echo 'Syntax DOXYGENed'":
        \"echo 'Syntax NORMAL'"<CR>

" Makes <Enter>, <Esc>, <Tab>, <Shift>+<Tab>, <Up>, <Down>, <PgUp> and <PgDown> works as expected 
" with complete popups.
inoremap <silent> <expr> <CR>       pumvisible() ? "\<C-Y>"                  : "\<CR>"
inoremap <silent> <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-P>\<C-N>" : "\<PageDown>"
inoremap <silent> <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-P>\<C-N>"   : "\<PageUp>"


" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" On insert mode allow insert a new line above or below the current line no mater the position of 
" cursor
inoremap <C-CR>   <C-O>o
inoremap <C-S-CR> <C-O>O
inoremap <silent> <expr> <C-J> pumvisible() ? "\<Down>" : "\<C-O>o"
inoremap <silent> <expr> <C-K> pumvisible() ? "\<Up>" : "\<C-O>O"

inoremap <silent> <Home>     <C-R>=InsertHome()<CR>
nnoremap <silent> <expr>     <Home>   strpart(getline(line('.')), 0, col('.')-1) =~ '\S' ? 
    \ "^" : 
    \ strpart(getline(line('.')), col('.')-1, 1) =~ '\s' ? "^" : "0"

" Move lines Up and Down and, if needed, indent them again
" Up
nnoremap <silent> <C-K> :let _tmp_offset=col('.')-match(getline('.'), "\\S")<CR>
                        \:move -2<CR>
                        \=
                        \:execute "normal " . (match(getline('.'), "\\S")+_tmp_offset < 0 ? 1: match(getline('.'), "\\S")+_tmp_offset) . "\|"<CR>
                        \:unlet _tmp_offset<CR>
vnoremap <silent> <C-K> :m'<-2<CR>gv=gv
" Down
nnoremap <silent> <C-J> :let _tmp_offset=col('.')-match(getline('.'), "\\S")<CR>
                          \:move +<CR>
                          \==
                          \:execute "normal " . (match(getline('.'), "\\S")+_tmp_offset < 0 ? 1: match(getline('.'), "\\S")+_tmp_offset) . "\|"<CR>
                          \:unlet _tmp_offset<CR>
vnoremap <silent> <C-J> :m'>+<CR>gv=gv

" Dev helper mapping to show syntex region under cursor
map <LEADER>sr :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                     \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                     \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"     new commands I create
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
command! -bang -nargs=? ExploreRemote call ExploreRemote(<bang>0)

" command abbreviations
cabbrev Q q!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('autocmd')
    " Actions taken to every buffer
    autocmd! BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

    " Markdown types
    autocmd! FileType mkd       setfiletype markdown
    autocmd! FileType markdown  set ai formatoptions=tcroqwan2 comments=n:&gt; nocindent tw=80

    " Syslog types
    autocmd! BufRead,BufNewFile *.log  set filetype=syslog 

    " JSON file type
    autocmd! BufRead,BufNewFile *.json set filetype=json 

    " QML file type
    autocmd! BufRead,BufNewFile *.qml set filetype=qml 

    " QMake
    autocmd! BufNewFile,BufRead *.pro set filetype=qmake
    autocmd! BufNewFile,BufRead *.pri set filetype=qmake

    " Git commits
    autocmd! BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

    " Objective-Cpp
    autocmd! BufNewFile,BufRead *.mm set filetype=objcpp

    " Compiler definition
    autocmd! BufNewFile,BufRead *.p[l|m] compiler perl
    autocmd! BufNewFile,BufRead *.py compiler pyunit

    " Show stupid extra empty spaces
    autocmd BufNewFile,BufRead * syntax match annoyingspace '^\(\t\+ \| \+\t\)\|[\t ]\+$' | highlight annoyingspace ctermbg=red guibg=red

    """""""""""""""""""""""""""""""""""""""""""""""""""
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python integration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('python')
" add python path to vim path. This way we can use 'gf' on imports!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif

if has('autocmd')
    autocmd! BufNewFile,BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd! BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd! BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd! BufWritePre *.py normal m`:%s/\s\+$//e ``
    autocmd! FileType python setlocal foldmethod=indent
endif


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
    let header_extensions = ['h', 'hh', 'H', 'HH', 'hxx', 'HXX']
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

" Calling ':QFix' will "toggle" the quickfix open and closed. It's easiest to map this to something 
" fast.
" If you want to force the window open, use ':QFix!' and the window will open or stay open.
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Automatically align tables with Tabularize
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
inoremap <silent> <Bar>  <Bar><Esc>:call <SID>align()<CR>a

" Toggle Vexplore with Ctrl-E
function! ExploreRemote(resetHost)
    if !exists('g:remoteHost') || empty(g:remoteHost) || a:resetHost == 1
        let g:remoteHost = input('Remote host: ')
    endif
    if !empty(g:remoteHost)
        exec 'e scp://' . g:remoteHost . '/'
    else
        echo 'Canceling remote explore.'
    endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Thirdy-party script integration
"     Any variable set or custom mapping needed by a script is made in this section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoClose
imap <silent> <C-F9>      <C-O>:AutoCloseToggle<CR>
nmap <silent> <C-F9>      :AutoCloseToggle<CR>
nmap <silent> <LEADER>ac  :AutoCloseToggle<CR>
"let g:AutoClosePumvisible = {"Esc": "\<C-E>", "Enter": "\<C-Y>"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoHighlight
"nmap <silent> <C-F10>     :AutoHighlightToggle<CR>
"imap <silent> <C-F10>     <C-O>:AutoHighlightToggle<CR>
"map  <silent> <LEADER>ah  :AutoHighlightToggle<CR>
"let g:AutoHighlightInitialStatus=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder
let g:fuf_modesDisable      = []
let g:fuf_buffer_prompt     = 'Buffer[]>'
let g:fuf_file_prompt       = 'File[]>'
let g:fuf_dir_prompt        = 'Directory[]>'
let g:fuf_mrufile_prompt    = 'Recent open file[]>'
let g:fuf_mrucmd_prompt     = 'Command[]>'
let g:fuf_bookmark_prompt   = 'Bookmark[]>'
let g:fuf_tag_prompt        = 'Tag[]>'
let g:fuf_taggedfile_prompt = 'Tagged file[]>'
let g:fuf_jumplist_prompt   = 'Jump list[]>'
let g:fuf_changelist_prompt = 'Change list[]>'
let g:fuf_quickfix_prompt   = 'Quickfix[]>'
let g:fuf_line_prompt       = 'Line[]>'
let g:fuf_help_prompt       = 'Help[]>'

nmap <silent> <LEADER>fb :FufBuffer<CR>
nmap <silent> <LEADER>ff :FufFile<CR>
nmap <silent> <LEADER>fd :FufDir<CR>
nmap <silent> <LEADER>fr :FufMruFile<CR>
nmap <silent> <LEADER>fc :FufMruCmd<CR>
nmap <silent> <LEADER>fk :FufBookmark<CR>
nmap <silent> <LEADER>ft :FufTag<CR>
nmap <silent> <LEADER>fe :FufTaggedFile<CR>
nmap <silent> <LEADER>fj :FufJumpList<CR>
nmap <silent> <LEADER>fg :FufChangeList<CR>
nmap <silent> <LEADER>fq :FufQuickfix<CR>
nmap <silent> <LEADER>fl :FufLine<CR>
nmap <silent> <LEADER>fh :FufHelp<CR>

map  <silent> <LEADER>fiw :FufTagWithCursorWord!<CR>
nmap <silent> <LEADER>fab :FufAddBookmark<CR>
vmap <silent> <LEADER>fas :FufAddBookmarkAsSelectedText<CR>
nmap <silent> <LEADER>fwf :FufFileWithCurrentBufferDir<CR>
nmap <silent> <LEADER>fwd :FufDirWithCurrentBufferDir<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nmap <silent> <F2>       :NERDTreeToggle<CR>
imap <silent> <F2>       <C-O>:NERDTreeToggle<CR>
nmap <silent> <S-F2>     :NERDTreeFind<CR>
imap <silent> <S-F2>     <C-O>:NERDTreeFind<CR>
map  <silent> <LEADER>d  :NERDTreeToggle<CR>
map  <silent> <LEADER>D  :NERDTreeFind<CR>

if has('autocmd')
    autocmd BufEnter * silent! NERDTreeMirror
endif

let g:NERDTreeQuitOnOpen  = 1
let g:NERDTreeDirArrows   = 1
let g:NERDTreeStatusline  = "  "
let g:NERDTreeMinimalUI   = 1
let g:NERDTreeHijackNetrw = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
    " uses PuTTY on windows
	let g:netrw_scp_cmd  = 'pscp -q -batch'
    let g:netrw_sftp_cmd = 'psftp'
    let g:netrw_cygwin   = 0
endif

let g:netrw_browse_split     = 4
let g:netrw_altv             = 1
let g:netrw_winsize          = 26
let g:netrw_silent           = 1
let g:netrw_special_syntax   = 1
let g:netrw_fastbrowse       = 2
let g:netrw_menu             = 0
let g:netrw_use_errorwindow  = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
nmap <F5>    :GundoToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" swapit.vim
if exists(":SwapList")
    SwapList tfUpper TRUE FALSE
    SwapList cardinalsLower north south east west
    SwapList cardinalsUpper NORTH SOUTH EAST WEST
    SwapList cardinalsCamel North South East West
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Peep open
if has("mac")
    if mapcheck('<LEADER>t', 'n')
        nunmap <LEADER>t
    endif
    nmap <unique> <silent> <LEADER>t <Plug>PeepOpen
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang_complete
let g:clang_snippets          = 1
let g:clang_snippets_engine   = 'ultisnips'
let g:clang_complete_patterns = 1
let g:clang_auto_select       = 1
let g:clang_complete_auto     = 0
if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
    if exists("$LLVMDIR")
        let g:clang_exec = '"' . $LLVMDIR . '\bin\clang.exe'
    else
        let g:clang_exec = '"C:\llvm\bin\clang.exe'
    endif
    let g:clang_user_options = '2> NUL || exit 0 "'
else
    let g:clang_use_library = 1
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips
let g:UltiSnipsUsePythonVersion    = 2   " or 3
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
if has("win32") || has("dos32") || has("win16") || has("dos16") || has("win95") || has("win64")
    let g:UltiSnipsSnippetsDir = $HOME . "/vimfiles/snippets"
else
    let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selectbuf
"nmap <unique> <silent> <F3> <Plug>SelectBuf
noremap <silent> <Plug>SelBufQuitKey <ESC>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimpager
let vimpager_use_gvim = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VOom
noremap <silent> <F4> :exec "VoomToggle " . &ft<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json
if has('autocmd')
    augroup json_autocmd 
        autocmd! 
        autocmd FileType json set autoindent 
        autocmd FileType json set formatoptions=tcq2l 
        autocmd FileType json set textwidth=78 shiftwidth=2 
        autocmd FileType json set softtabstop=2 tabstop=8 
        autocmd FileType json set expandtab 
        autocmd FileType json set foldmethod=syntax 
    augroup END
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
noremap <silent> <LEADER>pt :Helptags<CR>:echo "Help tags updated for Pathogen bundles"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
let g:SuperTabDefaultCompletionType        = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-i>"
let g:SuperTabLongestEnhanced              = 1
let g:SuperTabLongestHighlight             = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rooter
if has('autocmd')
    autocmd BufEnter * :Rooter
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Virtualenv Helper
"     If I do have a virtualenv active, give it a chance to load its own .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


