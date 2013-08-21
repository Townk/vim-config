" Overwrite settings.
" Play nice with supertab
let b:SuperTabDisabled=1

imap     <silent><buffer>       <ESC>     <Plug>(unite_exit)
imap     <silent><buffer>       <C-j>     <Plug>(unite_select_next_line)
imap     <silent><buffer>       <C-k>     <Plug>(unite_select_previous_line)
imap     <silent><buffer>       jj        <Plug>(unite_insert_leave)
"imap     <silent><buffer><expr> j         unite#smart_map('j', '')
imap     <silent><buffer>       <TAB>     <Plug>(unite_select_next_line)
imap     <silent><buffer>       <S-TAB>   <Plug>(unite_select_previous_line)
imap     <silent><buffer>       <C-w>     <Plug>(unite_delete_backward_path)
imap     <silent><buffer>       '         <Plug>(unite_quick_match_default_action)
imap     <silent><buffer>       "         <Plug>(unite_quick_match_choose_action)
imap     <silent><buffer>       <C-y>     <Plug>(unite_narrowing_path)
imap     <silent><buffer>       <C-r>     <Plug>(unite_narrowing_input_history)

nmap     <silent><buffer>       <ESC>     <Plug>(unite_exit)
nmap     <silent><buffer>       '         <Plug>(unite_quick_match_default_action)
nmap     <silent><buffer>       "         <Plug>(unite_quick_match_choose_action)
nmap     <silent><buffer>       <C-y>     <Plug>(unite_narrowing_path)
nmap     <silent><buffer>       <C-r>     <Plug>(unite_narrowing_input_history)
nnoremap <silent><buffer><expr> l         unite#smart_map('l', unite#do_action('default'))

let unite = unite#get_current_unite()
if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
endif

nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
            \ empty(unite#mappings#get_current_filters()) ?
            \ ['sorter_reverse'] : [])

" Runs "split" action by <C-s>.
imap <silent><buffer><expr> <C-s>     unite#do_action('split')

