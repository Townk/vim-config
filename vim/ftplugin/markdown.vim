set ai
set formatoptions=tcroqwan2
set comments=n:&gt;
set nocindent
set tw=80
call textobj#sentence#init()

let did_open_markdown = 0
for arg in argv()
    if fnamemodify(arg, ':e') == 'markdown' ||
     \ fnamemodify(arg, ':e') == 'md' ||
     \ fnamemodify(arg, ':e') == 'mdown' ||
     \ fnamemodify(arg, ':e') == 'mkd' ||
     \ fnamemodify(arg, ':e') == 'mkdn' ||
     \ fnamemodify(arg, ':e') == 'mdd'
        let did_open_markdown = 1
        break
    endif
endfor

if has('gui_running') && did_open_markdown
    colorscheme pencil
    set background=light
    set guifont=Cousine:h18
    set linespace=8
    set nonumber
    set norelativenumber
    set laststatus=0
    set nocursorline
    set columns=82
    set lines=25

    call airline#init#sections()
    let g:airline_powerline_fonts=0
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.readonly = 'ro'

    AirlineTheme pencil
    call gitgutter#disable()
endif

unlet did_open_markdown
