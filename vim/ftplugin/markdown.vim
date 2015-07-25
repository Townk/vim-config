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

unlet did_open_markdown
