let langs = ['ruby', 'yaml', 'vim', 'c', 'cpp', 'java', 'sh', 'python', 'php']

for lang in langs
    unlet b:current_syntax
    silent! exec printf("syntax include @%s syntax/%s.vim", lang, lang)
    exec printf("syntax region %sSnip matchgroup=Snip start='```%s' end='```' contains=@%s",
                \ lang, lang, lang)
endfor
let b:current_syntax='mkd'

syntax sync fromstart

