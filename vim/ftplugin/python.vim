compiler pyunit
set smartindent
set cinwords=if,elif,else,for,while,try,except,finally,def,class
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
setlocal foldmethod=indent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python integration with Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('python')
" add python path to vim path. This way we can use 'gf' on imports!
python << EOF
import os
import sys
import vim
for p in sys.path:
  if os.path.isdir(p):
    vim.command(r"setlocal path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif



if has('autocmd')
    autocmd! BufWritePre *.py normal m`:%s/\s\+$//e ``
endif
