" if we open a .class file we check if 'jad' is available on the system
" and in case it is we decompile the .class file and try to present it
" on the current buffer
if executable('jad')
    silent %!jad -noctor -ff -i -p %
    set readonly
    silent normal gg=G
    set nomodified
    set ft=java
    set syntax=on
endif
