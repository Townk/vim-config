" Vim color scheme
" Name:         townklight.vim
" Author:       Thiago Alves <talk@thiagoalves.com.br>
" Version:      1.0

" Based on the Vilight AND twilight themes for TextMate/vim.org
" Distributable under the same terms as Vim itself (see :help license)

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
              
let g:colors_name="Townklight"

hi Normal         guifg=#f8f8f8 ctermfg=15 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE
hi Cursor         guifg=#212121            guibg=#9ca9b7
hi CursorLine     guifg=NONE               guibg=#1b1b1b ctermbg=234 gui=NONE cterm=NONE
hi CursorColumn   guifg=NONE               guibg=#1b1b1b ctermbg=234 gui=NONE cterm=NONE
hi Directory      guifg=#6c8095            guibg=NONE
hi Folded         guifg=#5f5a60 ctermfg=59 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE
hi FoldColumn	  guifg=#9ca9b7            guibg=NONE                gui=italic
hi vimFold	      guifg=#dee4ea		       guibg=NONE                gui=italic
hi IncSearch      guifg=NONE               guibg=#343a44 ctermbg=237 gui=NONE cterm=NONE
hi Search         guifg=NONE               guibg=#343a44 ctermbg=237 gui=NONE cterm=NONE
hi LineNr         guifg=#424242            guibg=NONE
hi ModeMsg        guifg=#8f9d6a            guibg=NONE
hi MoreMsg        guifg=#8f9d6a            guibg=NONE
hi NonText        guifg=#424242            guibg=NONE
hi VertSplit      guifg=#3f3f3f ctermfg=237 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi StatusLine     guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=bold
hi StatusLineNC   guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLine        guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLineFill    guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLineSel     guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=bold
hi Visual         guifg=NONE               guibg=#3c4043 ctermbg=238 gui=NONE cterm=NONE
hi WildMenu       guifg=#6c8095            guibg=#ffffff
hi MatchParen	  guifg=#ff8888		       guibg=#330000             gui=bold
hi ErrorMsg	      guifg=#cf6a4c            guibg=NONE                gui=NONE
hi WarningMsg	  guifg=#eedd82		       guibg=NONE                gui=NONE
hi Title	      guifg=#cf6a4c		       guibg=NONE
                                           
"Syntax hilight groups                     
hi Comment        guifg=#5f5a60 ctermfg=59 guibg=NONE                gui=italic
hi Constant       guifg=#7587a6                                      gui=bold
hi Exception      guifg=#cf6a4c                                      gui=NONE
hi String         guifg=#8f9d6a                                      gui=NONE
hi Variable       guifg=#7587a6                                      gui=NONE
hi Number         guifg=#cf6a4c                                      gui=NONE
hi Define         guifg=#7587a6                                      gui=NONE
hi Boolean        guifg=#CF6A4C                                      gui=NONE
hi Float          guifg=#cf6a4c                                      gui=NONE
hi Identifier     guifg=#7587a6                                      gui=NONE
hi Statement      guifg=#cda869                                      gui=NONE
hi Keyword        guifg=#cda869                                      gui=NONE
hi PreProc        guifg=#7587a6                                      gui=NONE
hi Type           guifg=#9b859d		                                 gui=NONE		
hi Typedef        guifg=#cda869                                      gui=NONE
hi Special        guifg=#cda869                                      gui=NONE
hi SpecialChar    guifg=#7587a6                                      gui=NONE
hi SpecialComment guifg=#4f94cd                                      gui=NONE
hi Ignore         guifg=#848484                                      gui=NONE
hi Error          guifg=#cf6a4c            guibg=NONE                gui=underline
hi Todo           guifg=#f9ee98		       guibg=NONE                gui=bold
hi Pmenu          guifg=#212121            guibg=#9ca9b7
hi PmenuSel       guifg=#ffffff            guibg=#6c8095
hi PmenuSbar      guibg=#b6b6b6
hi PmenuThumb     guifg=#424242

"more groups
hi pythonClass  guifg=#cda869 guibg=NONE gui=NONE
hi pythonFunction  guifg=#CF6A4C guibg=NONE gui=NONE
hi pythonInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi pythonSymbol  guifg=NONE guibg=NONE gui=NONE
hi pythonBuiltin  guifg=#9ca9b7 guibg=NONE gui=NONE
hi pythonInstanceVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonRequire  guifg=#8F9D6A guibg=NONE gui=NONE
hi pythonGlobalVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonRegexp  guifg=#6c8095 guibg=NONE gui=NONE
hi pythonRegexpDelimiter  guifg=NONE guibg=NONE gui=NONE
hi pythonEscape  guifg=NONE guibg=NONE gui=NONE
hi pythonControl  guifg=#4f94cd guibg=NONE gui=NONE
hi pythonClassVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonOperator  guifg=NONE guibg=NONE gui=NONE
hi pythonException  guifg=#cf6a4c guibg=NONE gui=NONE
hi pythonPseudoVariable  guifg=NONE guibg=NONE gui=NONE
hi makoDelimiter  guifg=NONE guibg=NONE gui=NONE
hi makoComment  guifg=NONE guibg=NONE gui=NONE
hi htmlTag  guifg=#cda869 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#cda869 guibg=NONE gui=NONE
hi htmlTagName  guifg=#b6b6b6 guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#cf6a4c guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#cf6a4c guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#4f94cd guibg=NONE gui=NONE
hi yamlAnchor  guifg=NONE guibg=NONE gui=NONE
hi yamlAlias  guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#cda869 guibg=NONE gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=NONE guibg=NONE gui=NONE
hi cssColor  guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#7587a6 guibg=NONE gui=NONE
hi cssClassName  guifg=#cda869 guibg=NONE gui=NONE
hi cssValueLength  guifg=NONE guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#cf6a4c guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

"diff
hi DiffAdd        guifg=#8f9d6a          guibg=NONE
hi DiffChange     guifg=#cda869          guibg=NONE
hi DiffText       guifg=#b6b6b6          guibg=NONE
hi DiffDelete     guifg=#cf6a4c          guibg=NONE
