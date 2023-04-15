 "Vim color scheme
" Theme: BlueKeywords
" Author: [Your Name]

let g:colors_name='miss'

hi clear
if exists("syntax_on")
    syntax reset
endif

" Define the color palette
hi Normal          guifg=#333333 guibg=#f2f2f2
hi Comment         guifg=#999999
hi Constant        guifg=#1c84c6
hi Identifier      guifg=#1c84c6
hi Statement       guifg=#1c84c6
hi PreProc         guifg=#1c84c6
hi Type            guifg=#1c84c6
hi Special         guifg=#1c84c6
hi Error           guifg=#ff0000 guibg=NONE
hi Todo            guifg=#1c84c6 guibg=NONE

" Set the keyword colors
hi! link Keyword Identifier
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement
