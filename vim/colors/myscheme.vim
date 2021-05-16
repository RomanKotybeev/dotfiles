" Main color = 251 (light gray)
" 243 - 245 are dark gray for some effects
" Special colors are for paranthesis and searching/yanking

let g:colors_name='myscheme'

hi clear
if exists("syntax_on")
    syntax reset
endif

" --- Editor settings ---
hi Normal ctermfg=251 ctermbg=NONE cterm=NONE
hi Cursor ctermfg=251 ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=Black cterm=NONE
hi LineNr ctermfg=245 ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=243 ctermbg=NONE cterm=NONE

" --- Visual aid ---
hi MatchParen      ctermfg=251          ctermbg=8     cterm=NONE
hi Visual          ctermfg=White      ctermbg=DarkGray     cterm=NONE
hi VisualNOS       ctermfg=DarkGray   ctermbg=245     cterm=NONE
hi NonText         ctermfg=NONE       ctermbg=NONE        cterm=NONE
hi Todo    ctermfg=White   ctermbg=Black    cterm=underline,italic
hi Error            ctermfg=red        ctermbg=NONE    cterm=underline

" --- Prompt/Status ---
hi StatusLine      ctermfg=NONE         ctermbg=Black    cterm=NONE
hi StatusLineNC    ctermfg=245         ctermbg=Black    cterm=NONE
hi WildMenu        ctermfg=White        ctermbg=DarkGrey   cterm=NONE

" --- Window/Tab delimiters  ---
hi VertSplit       ctermfg=Gray        ctermbg=NONE    cterm=NONE
hi TabLine         ctermfg=245        ctermbg=Black    cterm=NONE
hi TabLineFill     ctermfg=NONE        ctermbg=Black    cterm=NONE
hi TabLineSel      ctermfg=White        ctermbg=243    cterm=NONE

" --- File Navigation / Searching -
hi Directory       ctermfg=White        ctermbg=4    cterm=NONE
hi Search          ctermfg=White        ctermbg=4      cterm=NONE
hi IncSearch       ctermfg=White        ctermbg=DarkGray   cterm=NONE

" --- Popup menu ---
hi Pmenu        ctermfg=NONE ctermbg=Black 
hi PmenuSel     ctermfg=NONE ctermbg=243
hi PmenuThumb   ctermfg=red ctermbg=243

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

" --- Diffs ---
hi DiffAdd    ctermfg=157 ctermbg=none cterm=none
hi DiffDelete ctermfg=218 ctermbg=none cterm=none
hi DiffChange ctermfg=228 ctermbg=none cterm=none
hi DiffText   ctermfg=229 ctermbg=none cterm=bold

" --- Spellings ---
hi SpellBad ctermbg=NONE ctermfg=red cterm=underline
hi SpellCap ctermbg=NONE ctermfg=NONE cterm=NONE
