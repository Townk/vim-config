compiler pyunit
set smartindent
set cinwords=if,elif,else,for,while,try,except,finally,def,class
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
setlocal foldmethod=indent

if has('autocmd')
    autocmd! BufWritePre *.py normal m`:%s/\s\+$//e ``
endif
