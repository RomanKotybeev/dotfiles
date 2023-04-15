" Main color = 251 (light gray)
" 243 - 245 are dark gray for some effects
" Special colors are for paranthesis and searching/yanking

let g:colors_name='myscheme'

hi clear
if exists("syntax_on")
    syntax reset
endif

" --- Editor settings ---
hi Normal ctermfg=LightGrey ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi LineNr ctermfg=Gray ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=yellow ctermbg=NONE cterm=NONE

" --- Visual aid ---
hi MatchParen      ctermfg=fg         ctermbg=DarkCyan   cterm=NONE
hi Visual          ctermfg=White      ctermbg=green  cterm=NONE
hi VisualNOS       ctermfg=DarkGray   ctermbg=245    cterm=NONE
hi NonText         ctermfg=NONE       ctermbg=NONE   cterm=NONE
hi Todo            ctermfg=green      ctermbg=NONE   cterm=bold
hi Error           ctermfg=red        ctermbg=NONE   cterm=italic

" --- Prompt/Status ---
hi StatusLine      ctermfg=DarkYellow   ctermbg=NONE    cterm=NONE
hi StatusLineNC    ctermfg=cyan    ctermbg=NONE    cterm=NONE

" --- Window/Tab delimiters  ---
hi VertSplit       ctermfg=Gray       ctermbg=NONE   cterm=NONE
hi VertSplit       ctermfg=Gray       ctermbg=NONE   cterm=NONE
hi TabLine         ctermfg=245        ctermbg=Black  cterm=NONE
hi TabLineFill     ctermfg=NONE       ctermbg=Black  cterm=NONE
hi TabLineSel      ctermfg=White      ctermbg=DarkCyan    cterm=NONE

" --- File Navigation / Searching -
"hi Directory       ctermfg=White        ctermbg=4    cterm=NONE
"hi Search          ctermfg=White        ctermbg=4      cterm=NONE
"hi IncSearch       ctermfg=White        ctermbg=DarkGray   cterm=NONE

" --- Popup menu ---
hi Pmenu        ctermfg=Green        ctermbg=Black  cterm=NONE
hi PmenuSel     ctermfg=NONE         ctermbg=Green  cterm=bold
hi WildMenu     ctermfg=Green        ctermbg=NONE   cterm=bold

" --- Columns ---
hi CursorColumn    ctermfg=NONE         ctermbg=Black    cterm=NONE
hi FoldColumn      ctermfg=DarkGray     ctermbg=Black    cterm=NONE
hi SignColumn      ctermfg=DarkGray     ctermbg=Black    cterm=NONE
hi Folded          ctermfg=DarkGray     ctermbg=Black    cterm=NONE

" --- Variable types ---
hi Comment ctermbg=NONE ctermfg=245 cterm=NONE
hi SpecialComment ctermbg=NONE ctermfg=245 cterm=italic
hi! link Constant Normal
hi! link Identifier Normal
hi! link Statement Normal
hi! link PreProc Normal
hi! link Type Normal
hi! link Special Normal

" --- Spellings ---
hi SpellBad ctermbg=NONE ctermfg=red cterm=NONE
hi SpellCap ctermbg=NONE ctermfg=NONE cterm=NONE

" --- Language Specific ---
hi PreCondit cterm=bold

" --- HTML ---
hi htmlH1        ctermfg=magenta    ctermbg=NONE       cterm=bold

hi markdownLinkText   ctermfg=NONE  ctermbg=NONE       cterm=underline
hi! link markdownCode       Comment
hi! link markdownCodeBlock  Comment
hi! link markdownUrl        Comment
